## ----eval=FALSE, echo=1--------------------------------------------------
#  Sys.setenv(SPARK_HOME="/path/to/spark/")

## ----eval=FALSE----------------------------------------------------------
#  library("SparkR")

## ----eval=FALSE----------------------------------------------------------
#  sc = sparkR.init(master="local")

## ----eval=FALSE----------------------------------------------------------
#  sc = sparkR.init(sparkPackages="com.databricks:spark-csv_2.11:1.0.3")

## ----eval=FALSE----------------------------------------------------------
#  sparkR.stop()

## ----eval=FALSE----------------------------------------------------------
#  ## Note :::
#  moby = SparkR:::textFile(sc, "data/moby_dick.txt")

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  R> moby
#  # MapPartitionsRDD[3] at textFile at NativeMethodAccessorImpl.java:-2

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  get_moby = function(x)
#    "Moby" %in% strsplit(x, split = " ")[[1]]
#  mobys = SparkR:::filterRDD(moby, get_moby)

## ----eval=FALSE----------------------------------------------------------
#  ## The answer is 77
#  count(mobys)

## ----eval=FALSE----------------------------------------------------------
#  ## There are different levels of storage
#  persist(mobys, "MEMORY_ONLY")

## ----eval=FALSE----------------------------------------------------------
#  vec_sp = SparkR:::parallelize(sc, 1:100)

## ----eval=FALSE----------------------------------------------------------
#  count(vec_sp)

## ----eval=FALSE----------------------------------------------------------
#  sql_context = sparkRSQL.init(sc)

## ----eval=FALSE----------------------------------------------------------
#  chicks_sp = createDataFrame(sql_context, chickwts)

## ----eval=FALSE----------------------------------------------------------
#  R> chicks_sp
#  # DataFrame[weight:double, feed:string]

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  R> head(chicks_sp, 2)
#  #  weight      feed
#  #1    179 horsebean
#  #2    160 horsebean

## ----eval=FALSE----------------------------------------------------------
#  R> select(chicks_sp,  "weight")
#  # DataFrame[weight:double]

## ----eval=FALSE----------------------------------------------------------
#  filter(chicks_sp, chicks_sp$feed == "horsebean")

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  chicks_cnt = groupBy(chicks_sp, chicks_sp$feed) %>%
#    summarize(count=n(chicks_sp$feed))

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  head(chicks_cnt, 2)
#  #      feed count
#  #1   casein    12
#  #2 meatmeal    11

## ----eval=FALSE, tidy=FALSE----------------------------------------------
#  arrange(chicks_cnt, desc(chicks_cnt$count))

