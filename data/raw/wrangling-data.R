
library(tidyverse)
library(here)
library(janitor)
library(jsonlite)
conflicted::conflict_prefer("filter", "dplyr")

# NYC dog licensing dataset -----------------------------------------------

# write_lines(read_lines(here("data/raw/nyc-dog-licenses.csv")), here("data/raw/nyc-dog-licenses.csv.gz"))

dog_licenses <- read_csv(
  here("data/raw/nyc-dog-licensing.csv.gz"),
  # Seems to be a problem below this row
  n_max = 118600,
  col_types = cols(
    AnimalBirthMonth = col_datetime("%m/%d/%Y %H:%M:%S %p"),
    LicenseIssuedDate = col_date("%m/%d/%Y"),
    LicenseExpiredDate = col_date("%m/%d/%Y")
  ))

dog_licenses <- dog_licenses %>%
  mutate(AnimalBirthMonth = lubridate::ymd(AnimalBirthMonth)) %>%
  clean_names(case = "snake") %>%
  rename(neighborhood_tabulation_area = nta,
         animal_birth_date = animal_birth_month,
         census_tract_2010 = census_tract2010)

write_csv(dog_licenses, here("data/nyc-dog-licenses.csv.gz"))

# NYC tax returns ---------------------------------------------------------

if(!file.exists(here("data/raw/16zpallagi_ny.csv.gz"))){
  # https://www.irs.gov/statistics/soi-tax-stats-individual-income-tax-statistics-2016-zip-code-data-soi
  tax <- read_csv("https://www.irs.gov/pub/irs-soi/16zpallagi.csv")

  # Big! Just save NY to `data/raw`
  tax_ny <-
    tax %>%
    filter(STATE == "NY") %>%
    write_csv(here("data/raw/16zpallagi_ny.csv.gz"))
}

tax_ny <- read_csv(here("data/raw/16zpallagi_ny.csv.gz"))

tax_ny_clean <- tax_ny %>%
  select(
    zip_code = zipcode,
    income_group = agi_stub,
    n_returns = N1,
    n_single = mars1,
    n_joint = MARS2,
    number_dependents = NUMDEP,
    total_income = A00100) %>%
  filter(zip_code %in% unique(dog_licenses$zip_code)) %>%
  write_csv(here("data", "nyc-tax-returns.csv"))


# NYC NTA populations -----------------------------------------------------

# From: https://data.cityofnewyork.us/City-Government/New-York-City-Population-By-Neighborhood-Tabulatio/swpk-hqdp
nyc_pop_raw_path <- here("data/raw/nyc-nta-population.csv")
if(!file.exists(nyc_pop_raw_path)){
  nyc_pop <- read_csv("https://data.cityofnewyork.us/api/views/swpk-hqdp/rows.csv?accessType=DOWNLOAD") %>%
    write_csv(nyc_pop_raw_path)
}

nyc_pop <- read_csv(nyc_pop_raw_path)

nyc_pop_clean <- nyc_pop %>%
  clean_names() %>%
  write_csv(here("data/nyc-nta-population.csv"))

# NYC Community District populations --------------------------------------

# From: https://data.cityofnewyork.us/City-Government/New-York-City-Population-By-Community-Districts/xi7c-iiu2
nyc_cd_pop_raw_path <- here("data/raw/nyc-cd-population.csv")
if(!file.exists(nyc_cd_pop_raw_path)){
  nyc_cd_pop <- read_csv("https://data.cityofnewyork.us/api/views/xi7c-iiu2/rows.csv?accessType=DOWNLOAD") %>%
    write_csv(nyc_cd_pop_raw_path)
}

nyc_cd_pop <- read_csv(nyc_cd_pop_raw_path)

nyc_cd_pop_clean <-
  nyc_cd_pop %>%
  gather(key = "year", value = "population", -Borough:-`CD Name`) %>%
  separate(year, into = c("year", NA), remove = TRUE, convert = TRUE) %>%
  clean_names() %>%
  write_csv(here("data/nyc-cd-population.csv"))


# NYC Parks ---------------------------------------------------------------

# https://data.cityofnewyork.us/Recreation/Directory-of-Parks/79me-a7rs

parks <- read_json("https://www.nycgovparks.org/bigapps/DPR_Parks_001.json",
    simplifyVector = TRUE) %>%
  as_tibble() %>%
  clean_names() %>%
  write_csv(here("data/nyc-parks.csv"))

# CO2 datasets ------------------------------------------------------------

import_co2_data <- function(.file) {
  .file %>%
    read_csv(
      skip = 57,
      col_names = c("year", "month", NA, "date_numeric", "co2_standard",
                    rep(NA, 5)),
      col_types = cols_only(
        year = "i",
        month = "i",
        date_numeric = "d",
        co2_standard = "d"
      )
    )
}

mauna_loa_stn <- url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/monthly_in_situ_co2_mlo.csv") %>%
  read_lines() %>%
  import_co2_data() %>%
  mutate(station = "Mauna Loa, Hawaii, USA")

alert_stn <- url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/monthly_flask_co2_alt.csv") %>%
  read_lines() %>%
  import_co2_data() %>%
  mutate(station = "Alert Station, NWT, Canada")

cape_grim_stn <- url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/CapeGrim_CO2_data_download.csv") %>%
  read_lines() %>%
  read_csv(
    skip = 25,
    col_names = c("year", "month", NA, "date_numeric", "co2_standard",
                  NA, NA),
    col_types = cols_only(
      year = "i",
      month = "i",
      date_numeric = "d",
      co2_standard = "d"
    )
  ) %>%
  mutate(station = "Cape Grim, Tasmania, Australia")

co2_data <- bind_rows(
  mauna_loa_stn,
  alert_stn,
  cape_grim_stn
)

write_csv(co2_data, here("data/co2.csv"))
