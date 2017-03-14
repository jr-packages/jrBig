## ----echo=FALSE----------------------------------------------------------
options(digits = 3)
options(dplyr.print_min = 3, dplyr.print_max = 3)

## ------------------------------------------------------------------------
library("dplyr")

## ----results="hide", message=FALSE---------------------------------------
library("dplyr")
data(ghg_ems, package="nclRbig")
ghg_ems = tbl_df(ghg_ems)

## ------------------------------------------------------------------------
head(ghg_ems, 3)

## ----message=FALSE-------------------------------------------------------
## ghg_ems[!is.na(ghs_ems$ECO2),]
filter(ghg_ems, !is.na(ECO2))

## ----message=FALSE-------------------------------------------------------
## ghg_ems[, c("Country", "Year", "ECO2")]
select(ghg_ems, Country, Year, ECO2)

## ----message=FALSE-------------------------------------------------------
select(ghg_ems, -1)

## ------------------------------------------------------------------------
## ghg_ems$total = ghg_ems$ECO2 + ghg_ems$MCO2
mutate(ghg_ems, total = ECO2 + MCO2)

## ------------------------------------------------------------------------
## ghg_ems[order(ghg_ems$MCO2),]
arrange(ghg_ems, MCO2) #Try desc(MCO2)

## ------------------------------------------------------------------------
## mean(ghg_ems$ECO2, na.rm=TRUE)
summarise(ghg_ems, mean(ECO2, na.rm=TRUE))

## ----eval=FALSE----------------------------------------------------------
#  vignette("chapter3", package="nclRbig")

## ------------------------------------------------------------------------
by_country = group_by(ghg_ems, Country)

## ------------------------------------------------------------------------
summarise(by_country, 
          count = n(), #No. per group
          m_ECO2 = mean(ECO2), # Mean
          s_ECO2 = sd(ECO2)) # Std dev

## ------------------------------------------------------------------------
x1 = select(ghg_ems, Country, ECO2, MCO2)
x2 = group_by(x1, Country)
x3 = summarise(x2, m_e = mean(ECO2, na.rm=TRUE), 
               m_m = mean(MCO2, na.rm=TRUE))
x4 = filter(x3, !is.na(m_e) | !is.na(m_m))

## ----eval=FALSE----------------------------------------------------------
#  select(group_by(summarise(....

## ------------------------------------------------------------------------
ghg_ems %>%
    select(Country, ECO2, MCO2) %>%
    group_by(Country) %>%
    summarise(m_e = mean(ECO2, na.rm=TRUE), 
               m_m = mean(MCO2, na.rm=TRUE)) %>%
    filter(!is.na(m_e) | !is.na(m_m))

## ----echo=FALSE----------------------------------------------------------
knitr::include_graphics("graphics/marmite.png")

## ----eval=FALSE----------------------------------------------------------
#  vignette("chaptere", package="nclRbig")

## -----2:-1---------------------------------------------------------------
library(dplyr)
data(ghg_ems, package="nclRbig")
db = src_sqlite(path=tempfile(), create = TRUE)
ghg_sqlite  = copy_to(db, ghg_ems, temporary = FALSE)

## ----echo=FALSE----------------------------------------------------------
# Link to a table
ghg_sqlite = tbl(db, "ghg_ems")
## Or via SQL
ghg_sqlite = tbl(db, sql("SELECT * FROM ghg_ems"))

## ------------------------------------------------------------------------
(mut = mutate(ghg_sqlite, total = ECO2 + MCO2))

## ------------------------------------------------------------------------
explain(mut)

## ----eval=FALSE----------------------------------------------------------
#  mut = collect(mut)

## ----eval=FALSE----------------------------------------------------------
#  vignette("chapter3", package="nclRbig")

