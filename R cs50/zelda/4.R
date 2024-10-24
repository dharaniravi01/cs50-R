library("tidyverse")

#load zelda
load("zelda.RData")


#filter on producer column
zelda <- zelda |>
  filter(str_detect(producers, "Shigeru Miyamoto")) |>
  group_by(title) |>
  #arrange them
  arrange(year, title, system) |>
  #make sure all system is different if year and title same
  distinct(title, year, system, .keep_all = TRUE)

#save
save(zelda, file = "4.RData")
