#' @name ghg_ems
#' @title ghg_ems
#' @description ghg_ems
#' @docType data
#' @format A data frame
NULL

#' @name miniaa
#' @title miniaa
#' @description Providers of health care in the USA are made publicly 
#' available by the US government. 
#' The resulting datasets are large (over 4 GB unzipped) and can be
#' accessed from http://download.cms.gov/nppes/NPI_Files.html.
#' In this dataset each row is a registered health care provider.
#' The columns contain information on these providers, including name,
#' address and telephone number. 
#' Because there are so many column variables (329) much of the data is
#' redundant. This data set is a sub set of the real data sets
#' @docType data
#' @format A data frame
NULL

#' @name pew
#' @aliases reshape_pew
#' @title pew
#' @description pew
#' @docType data 
#' @format A data frame
NULL


#' @name world_bank
#' @title world_bank
#' @description world_bank
#' @docType data
#' @format A data frame
NULL

#' @name dummy_data
#' @title A dummy data frame
#' @description A dummy data frame
#' @docType data
#' @format A data frame
#' @examples 
#' ## Code use to generate data
#' set.seed(1)
#' dummy_data = as.data.frame(matrix(runif(100), ncol=4))
NULL
