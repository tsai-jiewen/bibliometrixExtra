#'
#' @title Wrapping from the base function read.csv.
#'
#' @description
#' @details
#'
#' @param file a file name as the export file. (notice: add th subtitle .csv)
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' DTF <- syn_import(file = 'test1124.csv')
#'
#'

syn_import <- function(file="") {
  read.csv(file=file)
}
