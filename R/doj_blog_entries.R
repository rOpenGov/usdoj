#' @importFrom dplyr select
#' @importFrom dplyr %>%
#' @importFrom stringr str_replace
#' @importFrom tibble add_column
#' @export
doj_blog_entries <- function(n_results=50, search_direction="DESC", keyword=NULL, clean=TRUE) {
  component <- ""
  attachments <- ""

  if(!(search_direction == "ASC" | search_direction == "DESC")) {
    stop("Please specify ascending \"ASC\" or descending \"DESC\" order for search direction.") }

  base <- "http://www.justice.gov/api/v1/blog_entries.json?"
  pagesize <- "&pagesize="
  pagesize_n <- 50
  sort <- "&sort=date"
  direction <- "&direction="
  page <- "&page="
  api_url <- paste0(base, pagesize, pagesize_n, sort, direction, search_direction, page)

  cycle <- ceiling(n_results/pagesize_n)
  pagesize_n <- as.character(pagesize_n)

  results <- fetch_data(api_url, cycle, pagesize_n, clean, page_n=0, n_results, keyword, search_direction)

  results <- results %>%
    add_column(name = NA)

  results <- results %>%
    select(-component, -attachments)

  results$name <- str_replace(results$name, ",$", "")

  results <- messy_char_to_na(results)

  return(clean_dates(results)) }
