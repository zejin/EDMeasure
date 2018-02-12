library(devtools)

# resubmit the source package to cran 
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

submit_cran("EDMeasure")
