library(devtools)

# check the downstream dependencies
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

devtools::revdep_check("EDMeasure")