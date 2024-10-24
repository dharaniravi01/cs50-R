

#load zelda
load("zelda.RData")

#sort them by title
zelda <- zelda |>
  group_by(title) |>
  #separate in the order of year
  slice_min(order_by = year) |>
  arrange(year, title, system)



#save
save(zelda, file = "3.RData")

