#load air tibble from air.Rdata
load("air.RData")

#group the county column
air <- air |>
  group_by(county)|>
  #sort in high to low emission
  arrange(desc(emissions)) |>
  #take only the top row in each group
  slice_head()

#save the file
save(air, file = "5.RData")
