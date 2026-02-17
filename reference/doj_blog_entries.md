# Retrieve DOJ Blog Entries

This function retrieves blog entries from the U.S. Department of Justice
API. You can specify the number of results, sort direction, and an
optional keyword filter.

## Usage

``` r
doj_blog_entries(
  n_results = 50,
  search_direction = "DESC",
  keyword = NULL,
  clean = TRUE
)
```

## Arguments

- n_results:

  Integer. Number of blog entries to retrieve. Default is 50.

- search_direction:

  Character. Sort order: either "ASC" (oldest first) or "DESC" (newest
  first). Default is "DESC".

- keyword:

  Optional character string to filter results by keyword.

- clean:

  Logical. If TRUE, cleans up the blog body and teaser fields. Default
  is TRUE.

## Value

A cleaned dataframe containing DOJ blog entry metadata and content.

## Examples

``` r
# \dontrun{
# Retrieve a single DOJ blog entry
result <- doj_blog_entries(n_results = 1)
#> Warning: There were 2 warnings in `mutate()`.
#> The first warning was:
#> ℹ In argument: `created = anydate(as.numeric(created))`.
#> Caused by warning in `anydate()`:
#> ! NAs introduced by coercion
#> ℹ Run `dplyr::last_dplyr_warnings()` to see the 1 remaining warning.
print(result)
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           body
#> 1 Today, Attorney General Pamela Bondi toured the Port of Tampa Bay – the largest port in Florida – and received a briefing from the Port’s CEO, Paul Anderson.Attorney General Bondi and Port Leadership discussed the Port’s important role in safeguarding Floridians and the American people as a key port of entry into this US. They also discussed the vital role that government plays in helping protect national security at ports.                      Other topics discussed included Port Tampa Bay’s advancements in protecting against foreign threats to physical and cyber security infrastructure, securing the Panama Canal, and ongoing coordination with the American Association of Port Authorities (AAPA) and the Coalition for America’s Gateways and Trade Corridors (CAGTC).Attorney General Bondi closed the briefing by thanking all in attendance for their important work on protecting the American people, safeguarding our national security, and encouraging the flow of commerce.Attorney General Bondi concluded by stating “Our ports are often the first line of defense in protecting Americans from national security threats like human trafficking, drug smuggling, and cybercrime. It was an honor to spend time with Paul Anderson and his team, who are collaborating closely with government partners and doing incredible work to protect Floridians and our Nation in my hometown of Tampa.”                      Participants:Paul Anderson, President and CEO of Port Tampa BayCharles Klug, Principal Counsel of Port Tampa BayKen Washington, Vice President and Chief Information Officer of Port Tampa BayMark Dubina, Vice President of Security of Port Tampa BayLaura Lenhart, Vice President of Government Affairs of Port Tampa BaySue Bai, Assistant Deputy Attorney General for National SecurityCatharine Cypher, Deputy Chief of Staff, Department of Justice
#>   changed created       date
#> 1    <NA>    <NA> 2025-02-17
#>                                                                                                                                                       teaser
#> 1 Today, Attorney General Pam Bondi toured the Port of Tampa Bay – the largest port in Florida – and received a briefing from the Port’s CEO, Paul Anderson.
#>                                                                                                           title
#> 1 Readout: Attorney General Bondi Briefed on National Security, Anti-Human Trafficking Efforts at Port of Tampa
#>                                                                                                                        url
#> 1 https://www.justice.gov/opa/blog/readout-attorney-general-bondi-briefed-national-security-anti-human-trafficking-efforts
#>                                   uuid name
#> 1 224f5cae-d8c6-4aea-9b27-da3ef19d4aec <NA>
# }
```
