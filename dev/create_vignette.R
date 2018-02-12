library(devtools)

# creare a vignette
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

devtools::use_vignette("EDMeasure", pkg = "EDMeasure")
