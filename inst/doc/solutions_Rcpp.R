## ---- message=FALSE------------------------------------------------------
library("Rcpp")

## ----eval=FALSE----------------------------------------------------------
#  cppFunction('
#    double add_c(double x, double y){
#      double value = x + y;
#      return value;
#    }
#  ')

## ----results="hide"------------------------------------------------------
mean_r = function(x) {
  n = length(x)
  m = 0
  for(i in seq_along(x)) 
    m = m + x[i]/n
  m
}

sd_r = function(x) {
  n = length(x)
  var = 0; m = mean_r(x)
  for(i in seq_along(x)) {
    var = var + (x[i] - m)^2
  }
  sqrt(var/(n-1))
}
x = rnorm(10)
mean_r(x); mean(x)
sd_r(x); sd(x)

