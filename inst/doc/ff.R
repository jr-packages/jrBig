## ----message=FALSE-------------------------------------------------------
library("ff")

## ------------------------------------------------------------------------
filename = nclRbig::get_rand()

## ----echo=FALSE----------------------------------------------------------
ffx = read.csv.ffdf(file=filename, header=TRUE)
dd = read.csv(file=filename, header=TRUE)

