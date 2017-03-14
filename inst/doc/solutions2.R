## ----eval=FALSE----------------------------------------------------------
#  x = as.character(runif(1e6))
#  x[sample(1e6, 1e5)] = NA # 10% NAs
#  dd =  as.data.frame(replicate(10, x))

## ----eval=FALSE----------------------------------------------------------
#  f = function(x) {x[1] = 0; x}
#  g = function(e) e$x[1] = 0
#  x = rnorm(1e5)
#  e = new.env(); e$x = x
#  system.time(replicate(1000, f(x)))
#  system.time(replicate(1000, g(e)))

