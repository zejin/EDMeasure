library(devtools)

# install a package from the source package
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

devtools::install("EDMeasure", build_vignettes = TRUE)
