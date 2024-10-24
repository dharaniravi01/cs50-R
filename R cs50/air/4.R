#load air tibble from air.Rdata
load("air.RData")

#group the county column
air <- air |>
  group_by(county)|>
  filter(county == "OR - Baker") |>
  arrange(desc(emissions))

#save the file
save(air, file = "4.RData")
