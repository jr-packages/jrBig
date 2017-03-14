## ----message=FALSE-------------------------------------------------------
library("ff")

## ----echo=FALSE----------------------------------------------------------
ffx = read.csv.ffdf(file=filename, header=TRUE)
dd = read.csv(file=filename, header=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  dd = matrix(rnorm(1e5), ncol=100)
#  write.csv(dd, "/tmp/tmp.csv")
#  library("ff")
#  system.time(read.csv.ffdf(file="/tmp/tmp.csv", header=TRUE))
#  system.time(read.csv(file="/tmp/tmp.csv", header=TRUE))

