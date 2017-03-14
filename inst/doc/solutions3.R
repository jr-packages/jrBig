## ---- results="hide", echo=-1, message=FALSE-----------------------------
library("dplyr")
data(world_bank, package="nclRbig")

## ------------------------------------------------------------------------
wb = tbl_df(world_bank)

## ----results="hide"------------------------------------------------------
## wb only prints out 10 rows & and gives types

## ------------------------------------------------------------------------
## Flips the data frame on it's side

## ----results="hide"------------------------------------------------------
filter(wb, Country.Code=="AFG")
filter(wb, Year > 1980 & Year < 1990)

## ----results="hide"------------------------------------------------------
select(wb, -1)
select(wb, Year, gini)

## ----results="hide"------------------------------------------------------
mutate(wb, Year2010 = ifelse(Year > 2010, "yes", "no"))

## ----results="hide"------------------------------------------------------
arrange(wb, desc(Year), gini)

## ----results="hide"------------------------------------------------------
summarise(wb, mean(gdp_percap, na.rm=TRUE))

## ----echo=FALSE, results="hide"------------------------------------------
gb = group_by(wb, Year)
summarise(gb, mean(gini, na.rm=TRUE), mean(gdp_percap, na.rm=TRUE))

## ----results="hide", echo=FALSE------------------------------------------
gb = group_by(wb, Year, Country.Code)
summarise(gb, median(gini, na.rm=TRUE), median(gdp_percap, na.rm=TRUE))

## ----results="hide"------------------------------------------------------
wb %>% group_by(Year, Country.Code) %>%
    summarise(gini=median(gini, na.rm=TRUE)) %>%
    summarise(max(gini, na.rm=TRUE))

## ----results="hide"------------------------------------------------------
  wb %>% group_by(Country.Code, Year) %>%
    summarise(gini=median(gini, na.rm=TRUE)) %>%
    summarise(max(gini, na.rm=TRUE))

## ----eval=FALSE----------------------------------------------------------
#  wb %>% select(Country == "AFG") %>%
#    arrange(desc(YEAR), gini)

## ----echo=FALSE, results="hide"------------------------------------------
wb %>% 
  filter(Year > 1980 & Year < 1990) %>%
  select(-1) %>%
  mutate(Year2010 = ifelse(Year > 2010, "yes", "no"))

## ----eval=FALSE----------------------------------------------------------
#  db = src_sqlite(path=tempfile(), create=TRUE)
#  wb_sqlite = copy_to(db, world_bank, temporary = FALSE)
#  wb_sqlite = tbl(db, "world_bank")
#  src_desc(db) ## Gives you some details
#  src_tbls(db) ## Lists the tables in the DB

## ----eval=FALSE----------------------------------------------------------
#  head(wb_sqlite, 50)

