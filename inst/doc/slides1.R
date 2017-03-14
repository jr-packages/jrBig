## ----eval=FALSE----------------------------------------------------------
#  install.packages("drat")
#  drat::addRepo("rcourses")
#  install.packages("nclRbig")
#  library("nclRbig") # No errors

## ----eval=FALSE----------------------------------------------------------
#  install.packages("nclRbig", dependencies = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  ## This is new. Expect difficulties
#  vignette("slides1", package="nclRbig")

## ----echo=c(-1, -4), fig.height=5----------------------------------------
data(USArrests, package="datasets")
d = dist(USArrests)
fit = hclust(d)
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01,cex=0.7, las=1)
plot(fit, labels=rownames(d))

## ------------------------------------------------------------------------
pryr::object_size(USArrests)
pryr::object_size(d)

## ------------------------------------------------------------------------
benchmarkme::get_ram()

