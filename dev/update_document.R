library(devtools)

# generate documents in .Rd from comments
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

devtools::document("EDMeasure")
cat('useDynLib(EDMeasure, .registration = TRUE)', 
    file = 'EDMeasure/NAMESPACE', append = TRUE)

