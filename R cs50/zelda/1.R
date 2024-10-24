install.packages("tidyverse")
library("tidyverse")

#READ CSV
zelda <-read.csv("zelda.csv")



#split release into year and system
release_split <- str_split_fixed(zelda$release, "-", 2)
zelda$year <-release_split[, 1]

zelda$system <- release_split[, 2]

#remove release
zelda <- zelda |>
  select(!release)

#rearrange the columns
zelda <- zelda |>
  select(title, year, system, everything())

#take out the roles into columns
zelda <- zelda |>
  pivot_wider(
    id_cols = c(title, year, system),
    names_from = role,
    values_from = names
  )

#change column heading to lower
names(zelda) <- tolower(names(zelda))

#save the file
save(zelda, file = "zelda.RData")

