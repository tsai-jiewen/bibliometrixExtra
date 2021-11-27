
#'
#' @title Export a csv file to edit the synonyms table.
#'
#' @description
#' @details
#' @param file a file name as the export file. (notice: add th subtitle .csv)
#' @param data a dataset he biblio data
#' @param tag the field tag
#'
#' @return a csv file
#' @export
#'
#' @examples
#'
#' data(scientometrics, package = "bibliometrixData")
#' syn_export(
#' file = 'test1124.csv'   # export file name
#' data = scientometrics,  # the biblio data
#' tag = 'ID',             # the field tag
#' )
#'

syn_export <- function(data, tag = "", file = "") {
  tag_table <- bibliometrix::tableTag(M = data, Tag = tag)
  tag_df <- as.data.frame( tag_table )
  colnames( tag_df ) <- c('pattern', 'replace')
  tag_df['replace'] <- c(" ")
  write.csv( x = as.data.frame( tag_df ), file = file, row.names=FALSE)
}


