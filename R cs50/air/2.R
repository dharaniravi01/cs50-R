#load air tibble from air.Rdata
load("air.RData")

#go to emission column and sort
air <- air |>
  arrange(desc(emissions))

#save the file
save(air, file = "2.RData")
