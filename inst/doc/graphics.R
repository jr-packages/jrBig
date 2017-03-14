## ---- message=FALSE------------------------------------------------------
## Should run error free
library("bigvis")
data("movies", package="bigvis")

## ----message=FALSE-------------------------------------------------------
library("ggplot2")

## ----eval=FALSE, echo=FALSE----------------------------------------------
#  x = condense(bin(movies$length, width = 1))
#  plot(x)
#  sm = smooth(x, h = 5 / 100)
#  lines(sm[,1], sm[,2], col=2)
#  autoplot(x)
#  last_plot() %+% peel(x)

## ---- message=FALSE------------------------------------------------------
## Should run with no errors
library("tabplot")

## ----eval=FALSE----------------------------------------------------------
#  tableplot(movies[,3:5])

## ----eval=FALSE----------------------------------------------------------
#  tableplot(movies[,3:10])

