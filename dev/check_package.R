library(devtools)

# check the source package and record the time
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

system.time(devtools::check("EDMeasure", document = FALSE, manual = TRUE))
