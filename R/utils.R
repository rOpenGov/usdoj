#' @importFrom dplyr filter
#' @importFrom dplyr %>%
#' @importFrom dplyr mutate
#' @importFrom anytime anydate
#' @noRd
clean_dates <- function(results) {

  results %>%
    mutate(date = anydate(as.numeric(date)),
           created = anydate(as.numeric(created)),
           changed = anydate(as.numeric(changed))) }

#' @noRd
remove_tags <- function(html_string) {
  return(gsub("<.*?>", "", html_string)) }

#' @noRd
remove_breaks <- function(html_string) {
  return(gsub("\n", "", html_string)) }

#' @importFrom dplyr filter
#' @importFrom dplyr %>%
#' @importFrom stringr str_detect
#' @noRd
keyword_search <- function(results, keyword) {
  if(length(keyword) > 1) {
    keyword <- paste(keyword, collapse = "|") }

  results %>%
    filter(str_detect(body, keyword)) }

#' @importFrom dplyr slice
#' @importFrom dplyr %>%
#' @importFrom dplyr arrange
#' @noRd
slicey <- function(df, search_direction, n_results) {
  if(search_direction == "DESC") {
    df <- df %>%
      slice(1:n_results) }

  else {
    df <- df %>%
      arrange(n_results) %>%
      slice(1:n_results) }

  return(df) }

#' @importFrom httr GET
#' @importFrom dplyr %>%
#' @importFrom dplyr bind_rows
#' @importFrom stringr str_trim
#' @importFrom jsonlite fromJSON
#' @noRd
fetch_data <- function(api_url, cycle, pagesize_n, clean, page_n, n_results, keyword, search_direction) {

  out <- data.frame()
  while(nrow(out) < n_results) {

    results <- data.frame()
    for(i in 1:cycle) {
      page_n = page_n + 1
      raw_data <- GET(paste0(api_url, page_n))
      Sys.sleep(.2)

      data <- fromJSON(rawToChar(raw_data$content), flatten = TRUE)
      df <- data$results

      if(clean == TRUE) {
        df$body <- remove_tags(df$body)
        df$teaser <- remove_tags(df$teaser)
        df$body <- remove_breaks(df$body)
        df$body <- str_trim(df$body) }

      results <- bind_rows(results, df) }

    if(!(is.null(keyword))) {
      results <- keyword_search(results, keyword) }

    results <- slicey(results, search_direction, n_results)

    out <- bind_rows(out, results) }

  out <- slicey(out, search_direction, n_results)

  out <- out %>%
    select(-image, -topic)

  return(out) }
