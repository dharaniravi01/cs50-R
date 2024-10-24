#install and use tidyverse, dplyer
install.packages("tidyverse")
library(tidyverse)

install.packages("dplyr")
library(dplyr)

#read the csv into tibble
air <-read_csv("air.csv")

#rename using the rename()
air <- air |>
  select(!c("Pollutant Type", "SCC Code", "EIS Sector", "Source Description", "EPA Region", "FIPS")) |>
  rename(
    state = "State", county = "State-County", pollutant = POLLUTANT, emissions = "Emissions (Tons)",
    level_1 ="SCC LEVEL 1", level_2 ="SCC LEVEL 2", level_3 ="SCC LEVEL 3", level_4 ="SCC LEVEL 4"
    )


#save the file
save(air, file = "air.RData")
