# get the years csv

years <- c("2020.csv", "2021.csv", "2022.csv", "2023.csv", "2024.csv")



totals <- list()
for(year in years) {

  #read the csvs
  csv <- read.csv(year)

  #add total column
  csv$total <- round(apply(csv[, -1], MARGIN = 1, FUN = sum), 2)

  #get the new csvs into the total list
  totals[[year]] <- csv

}

#ask for country
country <- readline("Country: ")


#loop for the years
for(year in years) {

  if(country %in% totals[[year]]$country) {

    #find the number in the total column
    number <- totals[[year]]$total[totals[[year]]$country == country]
    cat(paste0(country, "(",year,"):", format(number, nsmall = 2), "\n"))
  }
}




