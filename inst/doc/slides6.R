## ----echo=FALSE----------------------------------------------------------
knitr::include_graphics("graphics/dawson.jpg")

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  devtools::install_github("hadley/bigvis")

## ----fig.keep="none"-----------------------------------------------------
par(mfrow=c(1, 2))
plot(1, 1, ylab="")
plot(rep(1, 1e3), rep(1, 1e3), ylab="")

## ----echo=3, message=FALSE-----------------------------------------------
library("bigvis")
set.seed(1)
x = rt(1e5, 5)

## ----message=TRUE--------------------------------------------------------
library("bigvis")
## Bin in blocks of 0.01
(x_sum = condense(bin(x, 0.01)))

## ----echo=1:2, fig.height=4----------------------------------------------
## h is the binwidth (similar to bin size)
x_smu = smooth(x_sum, h = 5 / 100)

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
                      cex.axis=0.9, las=1)
plot(x_sum, panel.first=grid(), xlim=c(-12, 12), 
     ylab="Count", pch=21, cex=0.6)
lines(x_smu, col=2, lwd=2)
text(5, 200, "Smoothed line", col=2)

## ---- echo=-1, message=FALSE, fig.height=4-------------------------------
library(ggplot2)
autoplot(x_sum) + theme_bw()

## ---- fig.height=4-------------------------------------------------------
autoplot(peel(x_smu)) + theme_bw()

## ------------------------------------------------------------------------
data(movies, package="bigvis")

## ----tidy=FALSE, message=FALSE-------------------------------------------
n_bins = 1e4
bin_data = with(movies, 
    condense(bin(length, find_width(length, n_bins)),
             bin(rating, find_width(rating, n_bins))))

## ----fig.height=4--------------------------------------------------------
ggplot(bin_data, aes(length, rating, fill=.count )) + 
  geom_raster() + theme_bw()

## ------------------------------------------------------------------------
## Longer than one day!!
subset(movies[ ,c("title", "length", "rating")], length > 24*60)

## ---- fig.height=4-------------------------------------------------------
last_plot() %+% peel(bin_data)

## ----eval=FALSE----------------------------------------------------------
#  vignette("graphics", package="nclRbig")

## ----message=FALSE, fig.height=5-----------------------------------------
library("tabplot")
tableplot(movies[,3:5])

## ------------------------------------------------------------------------
tableplot(movies[,3:5], sortCol=3)

## ----width=5-------------------------------------------------------------
tableplot(movies[,3:5], sortCol=3, from=0, to=10)

## ----eval=FALSE----------------------------------------------------------
#  vignette("graphics")

