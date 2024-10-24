library("tidyverse")

#load zelda
load("zelda.RData")

#sort the data according to year
zelda <- zelda |>
  group_by(year) |>
  summarize(releases = n()) |>
  arrange(desc(releases))


#save
save(zelda, file = "2.RData")
