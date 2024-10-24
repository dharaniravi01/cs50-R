#load air tibble from air.Rdata
load("air.RData")

#group by pollutants
air <- air |>
  group_by(pollutant) |>
  #sum up emissions for each pollutant
  summarize(emissions = sum(emissions)) |>
  #sort from high to low
  arrange(desc(emissions))

#save the file
save(air, file = "6.RData")

