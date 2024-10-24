library("tidyverse")

#load zelda
load("zelda.RData")


#filter out the columns with more than 1 producer
zelda <- zelda |>
  filter(str_count(producers, ",") >= 1) |>
  group_by(title) |>
  #arrange them
  arrange(year, title, system) |>
  #make sure all system is different if year and title same
  distinct(title, year, system, .keep_all = TRUE)

#save
save(zelda, file = "5.RData")
