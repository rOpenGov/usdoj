library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
library(tidyr)
library(anytime)


clean_dates <- function(results) {

  results %>%
    mutate(date = anydate(as.numeric(date)),
           created = anydate(as.numeric(created)),
           changed = anydate(as.numeric(changed))) }


remove_tags <- function(html_string) {
  return(gsub("<.*?>", "", html_string)) }


remove_breaks <- function(html_string) {
  return(gsub("\n", "", html_string)) }


keyword_search <- function(results, keyword) {
  if(length(keyword) > 1) {
    keyword <- paste(keyword, collapse = "|") }

  results %>%
    filter(str_detect(body, keyword)) }


slicey <- function(df, search_direction, n_results) {
  if(search_direction == "DESC") {
    df <- df %>%
      slice(1:n_results) }

  else {
    df <- df %>%
      arrange(n_results) %>%
      slice(1:n_results) }

  return(df) }


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



doj_press_releases <- function(n_results=50, search_direction="DESC", keyword=NULL, clean=TRUE) {

  if(!(search_direction == "ASC" | search_direction == "DESC")) {
    stop("Please specify ascending \"ASC\" or descending \"DESC\" order for search direction.") }

  base <- "https://www.justice.gov/api/v1/press_releases.json?"
  pagesize <- "&pagesize="
  pagesize_n <- 50
  sort <- "&sort=date"
  direction <- "&direction="
  api_url <- paste0(base, pagesize, pagesize_n, sort, direction, search_direction)

  cycle <- ceiling(n_results/pagesize_n)
  pagesize_n <- as.character(pagesize_n)

  results <- fetch_data(api_url, cycle, pagesize_n, clean, page_n=0, n_results, keyword, search_direction)

  results <- results %>%
    add_column(name = NA)

  for(i in 1:nrow(results)) {
    # Insert by row if nested list isn't empty
    if(length(results[[4]][[i]]) > 0) {
      results[[13]][[i]] <- paste0(results[[4]][[i]][[2]], collapse = " ", sep = ",") } }

  results <- results %>%
    select(-component, -attachment)

  return(clean_dates(results)) }



doj_speeches <- function(n_results=50, search_direction="DESC", keyword=NULL, clean=TRUE) {

  if(!(search_direction == "ASC" | search_direction == "DESC")) {
    stop("Please specify ascending \"ASC\" or descending \"DESC\" order for search direction.") }

  base <- "https://www.justice.gov/api/v1/speeches.json?"
  pagesize <- "&pagesize="
  pagesize_n <- 50
  sort <- "&sort=date"
  direction <- "&direction="
  api_url <- paste0(base, pagesize, pagesize_n, sort, direction, search_direction)

  cycle <- ceiling(n_results/pagesize_n)
  pagesize_n <- as.character(pagesize_n)

  results <- fetch_data(api_url, cycle, pagesize_n, clean, page_n=0, n_results, keyword, search_direction)

  results <- results %>%
    add_column(name = NA)

  for(i in 1:nrow(results)) {
    # Insert by row if nested list isn't empty
    if(length(results[[4]][[i]]) > 0) {
      results[[22]][[i]] <- paste0(results[[4]][[i]][[2]], collapse = " ", sep = ",") } }

  results <- results %>%
    select(-component, -attachment)

  return(clean_dates(results)) }



doj_blog_entries <- function(n_results=50, search_direction="DESC", keyword=NULL, clean=TRUE) {

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

  for(i in 1:nrow(results)) {
    # Insert by row if nested list isn't empty
    if(length(results[[4]][[i]]) > 0) {
      results[[12]][[i]] <- paste0(results[[4]][[i]][[2]], collapse = " ", sep = ",") } }

  results <- results %>%
    select(-component, -attachments)

  return(clean_dates(results)) }



z <-doj_press_releases(n_results = 100, search_direction = "DESC")

zz <- doj_speeches(n_results = 1000, search_direction = "DESC")

dbe <- doj_blog_entries(keyword = c("weapons", "firearms"))



# TODO: Clean empty teaser -- turn to NA
