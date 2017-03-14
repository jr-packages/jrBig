## ----eval=FALSE----------------------------------------------------------
#  install.packages("sparklyr")

## ----results="hide"------------------------------------------------------
library("sparklyr")
spark_available_versions()

## ----eval=TRUE-----------------------------------------------------------
spark_install(version = "2.0.0")

## ----eval=TRUE-----------------------------------------------------------
spark_installed_versions()

## ------------------------------------------------------------------------
# Typically, you'll want to connect to a remote instance.
sc = spark_connect(master = "local")

## ----eval=TRUE, results="hide", message=FALSE----------------------------
library("dplyr")
data(movies, package="ggplot2movies")
movies_tbl = copy_to(sc, movies)

## ----echo=-1, results="hide"-------------------------
options(width=55)
movies_tbl

## ----eval=FALSE--------------------------------------
#  # Doesn't work
#  tail(movies_tbl)

## ----------------------------------------------------
src_tbls(sc)

## ----------------------------------------------------
summarise(movies_tbl, 
          count = n(), 
          no_of_action = sum(action), 
          no_of_animation = sum(animation))

## ----------------------------------------------------
by_action = group_by(movies_tbl, action)
summarise(by_action, 
          mean = mean(rating), 
          sd = sd(rating)) 

## ----------------------------------------------------
library("DBI")
dbGetQuery(sc, "SELECT * FROM movies LIMIT 3")

## ----eval=FALSE--------------------------------------
#  m = movies_tbl %>%
#    mutate(good = as.numeric(rating > mean(rating))) %>%
#    ml_logistic_regression(good ~ Action + Animation +
#                               Comedy + Drama + Documentary +
#                               Romance + Short)

## ----eval=FALSE--------------------------------------
#  m

## ----------------------------------------------------
movie_types = as.data.frame(diag(7))
colnames(movie_types) = c("Action", "Animation", "Comedy",
                          "Drama", "Documentary", "Romance",
                          "Short")

## ----------------------------------------------------
movie_types_tbl = copy_to(sc, movie_types, overwrite=TRUE)

## ----eval=FALSE--------------------------------------
#  predict(m, movie_types_tbl, type="response")

