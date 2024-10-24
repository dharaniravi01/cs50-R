rail <- read.csv("rail.csv")
bus <- read.csv("bus.csv")


#ask for the route
user_route <- readline("Route: ")

#create reliability column
rail$reliability <- round((rail$numerator / rail$denominator) * 100)
rail$reliability <- as.numeric(rail$reliability)

bus$reliability <- round((bus$numerator / bus$denominator) * 100)
bus$reliabilty <- as.numeric(bus$reliability)


#filter peak and offpeak hours
#for rail
peak_rail <- subset(rail, peak == "PEAK")
offpeak_rail <- subset(rail, peak == "OFF_PEAK")
#for bus
peak_bus <- subset(bus, peak == "PEAK")
offpeak_bus <- subset(bus, peak == "OFF_PEAK")


#if route is in rail mode
if (user_route %in% rail$route) {

  filter_rail_peak <- subset(peak_rail, route == user_route)

  rail_peak_mean <- mean(filter_rail_peak$reliability, na.rm = TRUE)

  filter_rail_offpeak <- subset(offpeak_rail, route == user_route)

  rail_offpeak_mean <- mean(filter_rail_offpeak$reliability, na.rm = TRUE)

  print(paste0("On time ", round(rail_peak_mean), "% of the time during peak hours."))
  print(paste0("On time ", round(rail_offpeak_mean), "% of the time during off-peak hours."))


#if route is in bus mode
} else if (user_route %in% bus$route) {

  filter_bus_peak <- subset(peak_bus, route == user_route)

  bus_peak_mean <- mean(filter_bus_peak$reliability, na.rm = TRUE)

  filter_bus_offpeak <- subset(offpeak_bus, route == user_route)

  bus_offpeak_mean <- mean(filter_bus_offpeak$reliability, na.rm = TRUE)

  print(paste0("On time ", round(bus_peak_mean), "% of the time during peak hours."))
  print(paste0("On time ", round(bus_offpeak_mean), "% of the time during off-peak hours."))

} else print("Enter Valid Route")










































