# create the reference manual
if (.Platform$OS.type == "windows") {
  setwd("C:/Academia/Cornell/Research")
} else {
  setwd("~")
}

system("R CMD Rd2pdf EDMeasure")
system("mv EDMeasure.pdf EDMeasure/dev/doc")
# system("R CMD check EDMeasure")
