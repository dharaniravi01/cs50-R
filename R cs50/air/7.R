#load air tibble from air.Rdata
load("air.RData")


air <- air |>
  #group by level_1 and pollutant
  group_by(level_1, pollutant) |>
  #sum up emissions for each pollutant
  summarize(emissions = sum(emissions)) |>
  #sort alphabetically
  arrange(level_1, pollutant) |>
  rename(source = "level_1")

#save the file
save(air, file = "7.RData")
