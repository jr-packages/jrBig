## ----eval=FALSE----------------------------------------------------------
#  x = runif(1e7)
#  x[sample(1e7, 1e6)] = NA # 10% NAs
#  dd =  as.data.frame(replicate(10, x))

## ----echo=FALSE, cache=TRUE----------------------------------------------
x = runif(1e3)
x[sample(1e3, 1e2)] = NA # 10% NAs
dd =  as.data.frame(replicate(10, x))

## ----eval=FALSE----------------------------------------------------------
#  system.time(write.csv(dd, "dd.csv"))
#  #   user  system elapsed
#  #101.012   1.096 104.153
#  system.time(read.csv("dd.csv"))
#  #   user  system elapsed
#  #151.568   0.728 152.134

## ----eval=FALSE----------------------------------------------------------
#  system.time(saveRDS(dd, file="dd.RData"))
#  #   user  system elapsed
#  # 101.77    0.28  102.69
#  system.time(readRDS(file="dd.RData"))
#  #   user  system elapsed
#  #  5.052   0.104   5.148

## ----eval=FALSE----------------------------------------------------------
#  library("data.table")
#  system.time(fwrite(dd, "dd.csv"))
#  #   user  system elapsed
#  # 28.776   1.600   4.128
#  system.time(fread("dd.csv"))
#  #   user  system elapsed
#  #  21.93    0.18   22.07

## ----results="hide", eval=FALSE------------------------------------------
#  library("readr")
#  system.time(write_csv(dd, "dd.csv"))
#  #   user  system elapsed
#  # 189.44    1.54  190.77
#  system.time(read_csv("dd.csv"))
#  #   user  system elapsed
#  # 18.476   0.252  18.588

## ----eval=FALSE----------------------------------------------------------
#  library("feather")
#  system.time(write_feather(dd, "dd.feather"))
#  #   user  system elapsed
#  #  0.620   0.540   1.319
#  system.time(read_feather("dd.feather"))
#  #   user  system elapsed
#  #  0.356   0.068   0.422

## ----echo=FALSE----------------------------------------------------------
writes = c(104, 102, 4.1, 190, 1.319)
reads = c(152, 5.1, 22.07, 18.58, 0.422)
n = c("read.csv", "Rdata", "data.table", "readr", "feather")

par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.8, las=1, xaxs='i',yaxs='i', mfrow=c(1, 2))
barplot(writes, names.arg=n, col="steelblue", 
        border=NA, space=0.05, ylim=c(0, 200), 
        ylab="Time(s)")
abline(h=seq(0, 200, 20), col="white")
title("Write times", adj=1, 
      cex.main=1, font.main=2, col.main="black")
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,
    cex.axis=0.8, las=1, xaxs='i',yaxs='i')
barplot(reads, names.arg=n, col="steelblue", 
        border=NA, space=0.05, ylim=c(0, 160), 
        ylab="Time(s)")
abline(h=seq(0, 150, 20), col="white")
title("Read times", adj=1, 
      cex.main=1, font.main=2, col.main="black")

## ----eval=FALSE----------------------------------------------------------
#  vignette("chapter2", package="nclRbig")

## ------------------------------------------------------------------------
data("dummy_data", package="nclRbig")
head(dummy_data, 3)
dim(dummy_data)

## ----message=FALSE, echo=-1----------------------------------------------
library("dplyr")
dplyr::location(dummy_data)

## ------------------------------------------------------------------------
dum_cpy = dummy_data

## ------------------------------------------------------------------------
dum_cpy$V1 = dum_cpy$V1*2.0

## ------------------------------------------------------------------------
location(dummy_data)
location(dum_cpy)

## ------------------------------------------------------------------------
f = function(x) x[,4, drop=FALSE]

## ------------------------------------------------------------------------
location(dummy_data)
location(f(dummy_data))

