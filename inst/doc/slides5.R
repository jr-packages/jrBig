## ----eval=FALSE----------------------------------------------------------
#  install.packages("Rcpp")

## ----results="hide"------------------------------------------------------
nclRbig::test_rcpp()

## ------------------------------------------------------------------------
## R version
add_r = function(x, y) {
  return(x + y)
} 

## ----message=FALSE-------------------------------------------------------
library("Rcpp")
cppFunction('
  double add_c(double x, double y){
    double value = x + y;
    return value;
  }
')

## ------------------------------------------------------------------------
add_c

## ------------------------------------------------------------------------
add_c(1, 2)

## ----eval=FALSE----------------------------------------------------------
#  vignette("Rcpp", package="nclRbig")

## ----eval=FALSE----------------------------------------------------------
#  vignette("Rcpp", package="nclRbig")

## ------------------------------------------------------------------------
mean_r = function(x) {
  n = length(x)
  m = 0
  for(i in seq_along(x))
    m = m + x[i]/n
  m
}

## ----echo=FALSE----------------------------------------------------------
cppFunction('double mean_c(NumericVector x){
  int i;
  int n = x.size();
  double mean = 0;

  for(i=0; i<n; i++) {
    mean = mean + x[i]/n;
  }
  return mean;
}')

## ------------------------------------------------------------------------
library("microbenchmark")

## ------------------------------------------------------------------------
x = rnorm(1e4)

## ----cache=TRUE----------------------------------------------------------
z = microbenchmark(
  mean(x),
  mean_r(x),
  mean_c(x)
)

## ----echo=FALSE----------------------------------------------------------
par(mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01, cex.axis=0.9, las=1)
boxplot(z, ylab="Time", col="steelblue")
grid()

## ----eval=FALSE----------------------------------------------------------
#  vignette("Rcpp", package="nclRbig")

