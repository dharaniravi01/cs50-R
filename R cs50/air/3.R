#load air tibble from air.Rdata
load("air.RData")

#group the county column
air <- air |>
  group_by(county)|>
  filter(county == "OR - Baker")


#save the file
save(air, file = "3.RData")
