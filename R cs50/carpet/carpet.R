calculate_growth_rate <- function(years, visitors) {

  # TODO: Calculate yearly growth of visitors

  first_visitor <- visitors[1]
  last_visitor <- visitors[length(visitors)]
  diff_in_visitor <- last_visitor - first_visitor

  first_year <- years[1]
  last_year <- years[length(years)]
  diff_in_year <- last_year - first_year

  growth_rate <- diff_in_visitor / diff_in_year
  return(growth_rate)
}

predict_visitors <- function(years, visitors, year) {

  # TODO: Predict visitors in given year

  growth_rate <- calculate_growth_rate(years, visitors)

  last_year <- years[length(years)]
  new_visitor <- visitors[length(visitors)]
  diff_in_year <-year - last_year

  predict <- new_visitor + (growth_rate * diff_in_year )
  return(predict)
}


visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))


