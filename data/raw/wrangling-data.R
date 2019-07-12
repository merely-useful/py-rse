
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
