
library(tidyverse)
library(here)
library(janitor)

# NYC dog licensing dataset -----------------------------------------------

# write_lines(read_lines(here("data/raw/nyc-dog-licensing.csv")), here("data/raw/nyc-dog-licensing.csv.gz"))

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
  clean_names(case = "snake") %>%
  rename(neighborhood_tabulation_area = nta,
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

write_lines(
  read_lines(url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/monthly_in_situ_co2_mlo.csv")),
  here("data/raw/monthly-co2-mlo.csv")
)

mauna_loa_stn <- here("data/raw/monthly-co2-mlo.csv") %>%
  import_co2_data() %>%
  mutate(station = "Mauna Loa, Hawaii, USA")

write_lines(
  read_lines(url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/monthly_flask_co2_alt.csv")),
  here("data/raw/monthly-co2-alt.csv")
)

alert_stn <- here("data/raw/monthly-co2-alt.csv") %>%
  import_co2_data() %>%
  mutate(station = "Alert Station, NWT, Canada")

write_lines(
  read_lines(url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/CapeGrim_CO2_data_download.csv")),
  here("data/raw/monthly-co2-cg.csv")
)

cape_grim_stn <- here("data/raw/monthly-co2-cg.csv") %>%
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
