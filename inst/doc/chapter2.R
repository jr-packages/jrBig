## ----eval=FALSE----------------------------------------------------------
#  install.packages(c("devtools", "readr", "feather"))
#  devtools::install_github("Rdatatable/data.table")

## ----eval=FALSE----------------------------------------------------------
#  x = as.character(runif(1e6))
#  x[sample(1e6, 1e5)] = NA # 10% NAs
#  dd =  as.data.frame(replicate(10, x))

