#' Retrieve DOJ Press Releases
#'
#' This function retrieves press releases from the U.S. Department of Justice API.
#' You can specify the number of results, search direction, and optional keyword filtering.
#'
#' @param n_results Integer. Number of press releases to retrieve. Default is 50.
#' @param search_direction Character. "ASC" or "DESC" for ascending or descending sort by date. Default is "DESC".
#' @param keyword Optional character string to filter results by keyword.
#' @param clean Logical. If TRUE, cleans up the text fields. Default is TRUE.
#'
#' @return A cleaned dataframe containing DOJ press release metadata and content.
#'
#' @importFrom dplyr select
#' @importFrom dplyr %>%
#' @importFrom stringr str_replace
#' @importFrom tibble add_column
#'
#' @examples
#' \dontrun{
#' # Retrieve a single DOJ press release
#' result <- doj_press_releases(n_results = 1)
#' print(result)
#' }
#'
#' @export
doj_press_releases <- function(n_results=50, search_direction="DESC", keyword=NULL, clean=TRUE) {
  component <- ""
  attachment <- ""

  base <- "https://www.justice.gov/api/v1/press_releases.json?"
  pagesize <- "&pagesize="
  pagesize_n <- 50
  sort <- "&sort=date"
  direction <- "&direction="
  api_url <- paste0(base, pagesize, pagesize_n, sort, direction, search_direction)

  cycle <- ceiling(n_results / pagesize_n)
  pagesize_n <- as.character(pagesize_n)

  results <- fetch_data(api_url, cycle, pagesize_n, clean, page_n = 0, n_results, keyword, search_direction)

  results <- results %>%
    add_column(name = NA)

  for (i in 1:nrow(results)) {
    if (length(results[[4]][[i]]) > 0) {
      results$name[i] <- paste0(results[[4]][[i]][[2]], collapse = " ", sep = ",")
    }
  }

  results <- results %>%
    select(-component, -attachment)

  results$name <- str_replace(results$name, ",$", "")

  results <- messy_char_to_na(results)

  return(clean_dates(results))
}

