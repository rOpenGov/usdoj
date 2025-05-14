#' Retrieve DOJ Blog Entries
#'
#' This function retrieves blog entries from the U.S. Department of Justice API.
#' You can specify the number of results, sort direction, and an optional keyword filter.
#'
#' @param n_results Integer. Number of blog entries to retrieve. Default is 50.
#' @param search_direction Character. Sort order: either "ASC" (oldest first) or "DESC" (newest first). Default is "DESC".
#' @param keyword Optional character string to filter results by keyword.
#' @param clean Logical. If TRUE, cleans up the blog body and teaser fields. Default is TRUE.
#'
#' @return A cleaned dataframe containing DOJ blog entry metadata and content.
#'
#' @importFrom dplyr select
#' @importFrom dplyr %>%
#' @importFrom stringr str_replace
#' @importFrom tibble add_column
#'
#' @examples
#' \dontrun{
#' # Retrieve a single DOJ blog entry
#' result <- doj_blog_entries(n_results = 1)
#' print(result)
#' }
#'
#' @export
doj_blog_entries <- function(n_results = 50, search_direction = "DESC", keyword = NULL, clean = TRUE) {
  component <- ""
  attachments <- ""

  if (!(search_direction == "ASC" | search_direction == "DESC")) {
    stop("Please specify ascending \"ASC\" or descending \"DESC\" order for search direction.")
  }

  base <- "http://www.justice.gov/api/v1/blog_entries.json?"
  pagesize <- "&pagesize="
  pagesize_n <- 50
  sort <- "&sort=date"
  direction <- "&direction="
  page <- "&page="
  api_url <- paste0(base, pagesize, pagesize_n, sort, direction, search_direction, page)

  cycle <- ceiling(n_results / pagesize_n)
  pagesize_n <- as.character(pagesize_n)

  results <- fetch_data(api_url, cycle, pagesize_n, clean, page_n = 0, n_results, keyword, search_direction)

  results <- results %>%
    add_column(name = NA)

  results <- results %>%
    select(-component, -attachments)

  results$name <- str_replace(results$name, ",$", "")

  results <- messy_char_to_na(results)

  return(clean_dates(results))
}

