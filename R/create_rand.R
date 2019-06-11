#' Random data set creation
#' 
#' A simple function for creating a n by 2 matrix filled with random numbers. The
#' matrix is stored as a csv file. The function \code{get_rand} returns where the file
#' is stored.
#' @param filename  A filename (should have a .csv extension)
#' @param n Number of rows
#' @param seed Optional seed
#' @importFrom readr write_csv
#' @importFrom stats rnorm
#' @examples 
#' \dontrun{
#' create_rand("inst/raw-data/rand.csv", n=1e5, 1)
#' }
#' @export
create_rand = function(filename=NULL, n=1e4, seed=NULL) {
  if (!is.null(seed)) set.seed(seed)
  x = data.frame(x = rnorm(n), y = rnorm(n))
  if (!is.null(filename)) write_csv(x, path = filename)
  invisible(x)
}

#' @rdname create_rand
#' @export
get_rand = function(){
  system.file("raw-data", filename = "rand.csv", package = "jrBig")
}
