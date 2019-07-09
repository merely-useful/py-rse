
library(tidyverse)
library(here)

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

write_csv(dog_licenses, here("data/nyc-dog-licenses.csv.gz"))

# CO2 datasets ------------------------------------------------------------

write_lines(
  read_lines(url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/monthly_in_situ_co2_mlo.csv")),
  here("data/raw/monthly-co2-mlo.csv")
)

write_lines(
  read_lines(url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/monthly_flask_co2_alt.csv")),
  here("data/raw/monthly-co2-alt.csv")
)

write_lines(
  read_lines(url("https://raw.githubusercontent.com/DamienIrving/co2_dataset/master/CapeGrim_CO2_data_download.csv")),
  here("data/raw/monthly-co2-cg.csv")
)
