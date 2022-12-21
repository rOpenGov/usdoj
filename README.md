# usdoj: Accessing U.S. Department of Justice (DOJ) API Data

usdoj is an R package for fetching data from the United States Department of Justice API such as press releases, blog entries, and speeches. Optional parameters give users the ability to specify the number of results starting from the earlist or latest entries, and whether these results contain keywords. Data is returned in a dataframe.

### Install 

Install from CRAN:
```
install.packages("usdoj")
```

Install from GitHub:
```
require(devtools)
install_github("stephbuon/usdoj")
```

### Data

`doj_press_releases()` returns a dataframe with the following fields: 

- body: The text body of a press release.
- changed: ENTER. 
- created: ENTER. 
- date: ENTER
- teaser: A blurb about the press release.
- title: The title of the press release.
- url: The URL for the original press release hosted by the Attorney's Office. 
- UUID: A universal unique identifier for a single result
- VUUID: A universal unique identifier for a specific version of a single result

`doj_speeches()` returns a dataframe with the following fields: 

- body: The text body of the speech. 
- changed:
- created:
- date: 
- teaser: 
- title:
- url:
- uuid:
- vuuid:
- location.country:
- location.administrative_area:
- location.locality:
- location.postal_code:
- location.thoroughfare:
- location.sub_premise:
- location.phone_number:
- location.phone_number_extension:
- location.mobile_number:
- location.fax_number:

`doj_blog_entries` returns a dataframe with the following fields: 

ADD NAME 

- body: The text body of a blog entry.
- changed: ENTER. 
- created: ENTER. 
- date: ENTER
- teaser: A blurb about the press release.
- title: The title of the press release.
- url: The URL for the original press release hosted by the Attorney's Office. 
- UUID: A universal unique identifier for a single result
- VUUID: A universal unique identifier for a specific version of a single result

### Optional Arguments

- `n_results` The number of results to return. By default, 50 results are returned.
- `search_direction` Set to `ASC` or `DESC` to fetch data starting from the most or least recent entries. By default, data is sorted in descending order (the most recent entries).
- `clean` Set to `FALSE` to return data without additional cleaning. By default HTML tags, white space, line breaks, and other messy characters are removed. Epoch time is converted to year-month-day format. 

### Usage

```
library(usdoj)
```

Return a dataframe with 50 results starting at the latest recorded press releases. Data is cleaned. 
```
doj_blog_entries()
```

Return a dataframe with 10 results starting from the latest recorded press releases. Data is cleaned. 
```
doj_press_releases(n_results = 10, search_direction = "DESC")
```

Return a dataframe with 130 results starting from the earliest recorded press releases. Data is not cleaned. 
```
doj_speeches(n_results = 130, search_direction = "ASC", clean = FALSE)
```

Return a dataframe with 50 results where the body text includes keyword(s).
```
doj_blog_entries(keyword = c("weapons", "firearms"))
```

**Note**

usdoj manages request rate limits in compliance with the Department of Justice API. 

**Disclaimer**

This package is not officially related to or endorsed by the U.S. Department of Justice. 
