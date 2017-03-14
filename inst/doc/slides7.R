## ---- cache=FALSE, message=FALSE-----------------------------------------
library("ff")
## `get_rand()` Returns the full path
filename = nclRbig::get_rand()
ffx = read.csv.ffdf(file=filename, header = TRUE)

## ---- results="hide"-----------------------------------------------------
## Only 10000 rows (small) 
dim(ffx)

## ----eval=FALSE----------------------------------------------------------
#  colSums(ffx) # produces the following error:
#  
#  ## Error in colSums(ffx) : 'x' must be an array ...

## ----eval=FALSE----------------------------------------------------------
#  vignette("ff", package="nclRbig")

## ------------------------------------------------------------------------
length(chunk(ffx))

## ------------------------------------------------------------------------
chunk(ffx, length.out=10)[[1]]

## ----tidy=FALSE----------------------------------------------------------
m = numeric(10)
chunks = chunk(ffx, length.out=10)
for(i in seq_along(chunks))
  m[i] = min(ffx[chunks[[i]],])
min(m)

## ----eval=FALSE----------------------------------------------------------
#  vignette("chapter7", package="nclRbig")

## ------------------------------------------------------------------------
ffy = ffx
ffy[1, 1]  = 0

## ------------------------------------------------------------------------
ffx[1, 1]

## ---- echo=FALSE, eval=FALSE---------------------------------------------
#  r4bd::create_rand("example.csv", 1e6)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  system.time(ffx <- ff::read.csv.ffdf(file="/tmp/tmp.csv", header = TRUE))
#  system.time(x <- readr::read_csv("/tmp/tmp.csv"))

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  R> x = readr::read_csv("very_big.csv")
#  # Error: cannot allocate vector of size 12.8 Gb

## ------------------------------------------------------------------------
filename(ffx)

