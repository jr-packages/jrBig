## ----eval=FALSE----------------------------------------------------------
#  library(sparklyr)
#  sc = spark_connect(master = "local")

## ----eval=FALSE----------------------------------------------------------
#  library(dplyr)

## ----eval=FALSE----------------------------------------------------------
#  flights_tbl = copy_to(sc, nycflights13::flights, "flights")

## ----eval=FALSE----------------------------------------------------------
#  flights_tbl %>% filter(air_time > 10*60)

## ----eval=FALSE----------------------------------------------------------
#  delay = flights_tbl %>%
#    group_by(day) %>%
#    summarise(delay = mean(arr_delay))

## ----eval=FALSE----------------------------------------------------------
#  delay
#  delay_collect = delay %>% collect()

## ----eval=FALSE----------------------------------------------------------
#  ggplot(delay, aes(day, delay)) +
#    geom_point() +
#    geom_smooth()

