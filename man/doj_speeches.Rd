\name{doj_speeches}
\alias{doj_speeches}
\title{Fetch U.S. DOJ Speeches}
\usage{
  doj_speeches(
    n_results = 50,
    search_direction = "DESC",
    keyword = NULL,
    clean = TRUE
  )
}
\arguments{
  \item{n_results}{The number of results to return. By default, 50 results are returned.}

  \item{search_direction}{Set to ASC or DESC to fetch data starting from the most or least recent entries. By default, data is sorted in descending order (the most recent entries).}

  \item{keyword}{Only return results containing a keyword. Keyword can be a single word, a list or words, or a regex separated by the pipe delimiter}

  \item{clean}{Set to FALSE to return data without additional cleaning. By default HTML tags, white space, line breaks, and other messy characters are removed. Epoch time is converted to year-month-day format.}
}
\value{
  Dataframe containing API pull of U.S. DOJ speeches.
}
\description{
  For accessing U.S. Department of Justice (DOJ) open data speeches.
}
\examples{
  # Return a dataframe with 50 of the latest records. Data is cleaned.
  latest_records <- doj_speeches()
  head(latest_records)

  # Return a dataframe with 15 of the earliest records. Data is not cleaned.
  earliest_records <- doj_speeches(n_results = 15, search_direction = "ASC", clean = FALSE)
  head(earliest_records)
}

