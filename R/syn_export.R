
#'
#' @title Export a csv file to edit the synonyms table.
#'
#' @description
#' @details
#' @param file a file name as the export file. (notice: add th subtitle .csv)
#' @param data a dataset
#' @param tag
#'
#' @return a csv file
#' @export
#'
#' @examples
#' syn_export(scientometrics, tag='ID', 'test1127.csv')
#'

syn_export <- function(data, tag = "", file = "") {
  tag_table <- bibliometrix::tableTag(M = data, Tag = tag)
  tag_df <- as.data.frame( tag_table )
  colnames( tag_df ) <- c('pattern', 'replace')
  tag_df['replace'] <- c(" ")
  write.csv( x = as.data.frame( tag_df ), file = file, row.names=FALSE)
}


