# usdoj: Accessing U.S. Department of Justice (DOJ) API Data

usdoj is an R package for fetching data from the United States Department of Justice API such as press releases, blog entries, and speeches. Optional parameters give users the ability to specify the number of results starting from the earliest or latest entries, and whether these results contain keywords. Data is returned in a dataframe.

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

- body: The text body of a press release
- changed: Date data was changed
- created: Date data was created
- date: Date of press release content
- teaser: A blurb about the press release
- title: The title of the press release
- url: The URL for the original press release relating to the Attorney's Office and hosted by the U.S. DOJ
- uuid: A universal unique identifier for a single result
- vuuid: A universal unique identifier for a specific version of a single result
- name: The related office(s)

`doj_speeches()` returns a dataframe with the following fields: 

- body: The text body of a speech
- changed: Date data was changed 
- created: Date data was created
- date: Date of speech
- teaser: A blurb about the speech
- title: The title of the speech
- url: The URL for the original press release hosted by the Department of Justice
- uuid: A universal, unique identifier for a single result
- vuuid: A universal, unique identifier for a specific version of a single result
- location.country: Country location
- location.administrative_area: Administrative area
- location.locality: City 
- location.postal_code: postal code
- location.thoroughfare:
- location.sub_premise:
- location.phone_number: 
- location.phone_number_extension:
- location.mobile_number:
- location.fax_number:
- name: The related office(s)

`doj_blog_entries` returns a dataframe with the following fields: 

- body: The text body of a blog entry
- changed: Date data was changed
- created: Date data was created
- date: Date of press release content
- teaser: A blurb about the blog entry
- title: The title of the blog entry
- url: The URL for the original blog release from "Justice Blogs," by the U.S. DOJ
- uuid: A universal unique identifier for a single result
- vuuid: A universal unique identifier for a specific version of a single result
- name: The related office(s)

### Optional Arguments

| Argument | Description |
| ------------- | ------------- |
| `n_results`  | The number of results to return. By default, 50 results are returned.  |
| `search_direction`  | Set to `ASC` or `DESC` to fetch data starting from the most or least recent entries. By default, data is sorted in descending order (the most recent entries).  |
| `keyword` | Only return results containing a keyword. Keyword can be a single word, a list or words, or a regex separated by the pipe delimiter|
| `clean` | Set to `FALSE` to return data without additional cleaning. By default HTML tags, white space, line breaks, and other messy characters are removed. Epoch time is converted to year-month-day format.  |

### Usage

```
library(usdoj)
```

Return a dataframe with 50 of the latest recorded blog entries recorded. Data is cleaned. 
```
doj_blog_entries()
```

Return a dataframe with 10 of the latest recorded press releases. Data is cleaned. 
```
doj_press_releases(n_results = 10, search_direction = "DESC")
```

Return a dataframe with 130 of the earliest recorded speeches. Data is not cleaned. 
```
doj_speeches(n_results = 130, search_direction = "ASC", clean = FALSE)
```

Return a dataframe with 50 of the latest recorded blog entries where the body text includes keyword(s).
```
doj_blog_entries(keyword = c("weapons", "firearms"))
```

**Note**

usdoj manages request rate limits in compliance with the Department of Justice API. 

**Disclaimer**

This package is not officially related to or endorsed by the U.S. Department of Justice. 
