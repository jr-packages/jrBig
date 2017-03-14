## ---- message=FALSE------------------------------------------------------
library("Rcpp")

## ----eval=FALSE----------------------------------------------------------
#  cppFunction('
#    double add_c(double x, double y){
#      double value = x + y;
#      return value;
#    }
#  ')

