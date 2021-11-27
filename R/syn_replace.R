#'
#' @title Replace synonyms by importing a csv file.
#'
#' @description
#' @details
#'
#' @param df the edited file you import which includes synonyms and replaced terms
#' @param data a dataset the original biblio data
#' @param tag a field-tag, i.g. 'ID' or 'DE'.
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' data(scientometrics, package = "bibliometrixData")
#' scientometrics$ID <- syn_replace(
#'   df = DTF,               # the edited file you import
#'   data = scientometrics,  # the original biblio data
#'   tag = 'ID'              # the field tag
#' )

syn_replace <- function(df, data, tag){
  data[[tag]] <- gsub(
    ';_+', replacement = '; ',
    x= gsub('^_', replacement = ' ',
            x= gsub('\\s', replacement = '_',
                    x= gsub('-', replacement = '_-_', data[[tag]]
                    ) ) ) )
  for (i in 1:nrow(df)){
    data[[tag]] <- gsub(
      x = data[[tag]] ,
      pattern = paste0( '\\<', df[i, 'pattern'], '\\>' ),
      replacement = df[i, 'replace'])
  }
  data[[tag]] <- gsub('_-_', replacement = '-', x=data[[tag]] )
  data[[tag]] <- gsub('_', replacement = ' ', x=data[[tag]] )
  return( data[[tag]] )
}
