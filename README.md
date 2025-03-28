# usdoj: Accessing U.S. Department of Justice (DOJ) API Data

usdoj fetches blog entries and press releases from the [United States Department of Justice API](https://www.justice.gov/developer/api-documentation/api_v1). Optional parameters let users choose how many results to return, whether to start from the earliest or latest publications, and whether to include only results that contain specific keywords. Data is cleaned and structured for analysis and returned in a dataframe.

### Install 

Install from CRAN:
```
install.packages("usdoj")
```

Install from the [rOpenGov universe](https://ropengov.r-universe.dev/ui#builds):
```
# Enable repository from ropengov
options(repos = c(
  ropengov = 'https://ropengov.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'))
  
# Download and install usdoj
install.packages("usdoj")
```

### Usage

`doj_press_releases()` returns a dataframe with the following fields: 

- **body:** The text body of a press release
- **changed:** Date data was changed
- **created:** Date data was created
- **date:** Date of press release content
- **teaser:** A blurb about the press release
- **title:** The title of the press release
- **url:** The URL for the original press release relating to the Attorney's Office and hosted by the U.S. DOJ
- **uuid:** A universal unique identifier for a single result
- **vuuid:** A universal unique identifier for a specific version of a single result
- **name:** The related office(s)

`doj_blog_entries()` returns a dataframe with the following fields: 

- **body:** The text body of a blog entry
- **changed:** Date data was changed
- **created:** Date data was created
- **date:** Date of press release content
- **teaser:** A blurb about the blog entry
- **title:** The title of the blog entry
- **url:** The URL for the original blog release from "Justice Blogs," by the U.S. DOJ
- **uuid:** A universal unique identifier for a single result
- **vuuid:** A universal unique identifier for a specific version of a single result
- **name:** The related office(s)

#### Optional Arguments

| Argument | Description |
| ------------- | ------------- |
| `n_results`  | The number of results to return. By default, 50 results are returned.  |
| `search_direction`  | Set to `ASC` or `DESC` to fetch data starting from the most or least recent entries. By default, data is sorted in descending order (the most recent entries).  |
| `keyword` | Only return results containing a keyword. Keyword can be a single word, a list or words, or a regex separated by the pipe delimiter|
| `clean` | Set to `FALSE` to return data without additional cleaning. By default HTML tags, white space, line breaks, and other messy characters are removed. Epoch time is converted to year-month-day format.  |

### Examples

Load `usdoj`.
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

![alt text](https://github.com/stephbuon/homepage/blob/master/content/post/2023-04-01-usdoj-cran-release/index.en_files/figure-html/unnamed-chunk-1-1.png)

### Citation

Please cite the package as follows: 

Buongiorno S (2023). usdoj: For Accessing U.S. Department of Justice (DOJ) Open Data. https://github.com/stephbuon/usdoj, https://ropengov.github.io/usdoj/, https://github.com/rOpenGov/usdoj.

BibTeX: 

```
@Manual{,
  title = {usdoj: For Accessing U.S. Department of Justice (DOJ) Open Data},
  author = {Steph Buongiorno},
  year = {2023},
  note = {https://github.com/stephbuon/usdoj,
https://ropengov.github.io/usdoj/, https://github.com/rOpenGov/usdoj},
}
```

See [my website](https://stephbuon.github.io/) for more projects. 

**Note**

usdoj manages request rate limits in compliance with the Department of Justice API. 

**Disclaimer**

This package is not officially related to or endorsed by the U.S. Department of Justice. 

