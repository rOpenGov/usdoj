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
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   body
#> 1 On January 6, ICITAP marked its 40th anniversary – four decades of global engagement united by one mission: protecting U.S. national security through international law enforcement cooperation. Since its establishment on January 6, 1986, pursuant to Section 534(b)(3) of the Foreign Assistance Act, ICITAP has served as a critical instrument of U.S. foreign policy and national security. Congressional action in 1985 expanded a waiver to Section 660, enabling the Department of Justice to launch ICITAP to enhance foreign investigative capabilities under judicial or prosecutorial oversight while directly advancing U.S. security interests. Funded at $1.52 million in its inaugural year and housed within the Office of the Deputy Attorney General for its first six years, ICITAP initially focused on supporting investigations into significant human rights violations in El Salvador and strengthening investigative capacity across Latin America. Since joining the Criminal Division in 1993, ICITAP has steadily expanded its geographic reach and technical expertise to meet evolving global threats. Today, ICITAP delivers targeted training, mentoring, and advisory assistance to investigative, corrections, forensics, and related security-sector institutions in nearly 70 partner nations, with historical engagement in more than 120 countries worldwide. Working in close coordination with the Departments of Justice, State, Homeland Security, and Defense, ICITAP deploys U.S. law enforcement expertise to build partner capacity, strengthen public safety and homeland security, and produce measurable outcomes that counter transnational crime, terrorism, and illicit trafficking before they reach U.S. borders. ICITAP’s global portfolio spans a comprehensive range of law enforcement and security-sector disciplines, including counterterrorism; combating transnational criminal organizations; counter-narcotics and counter-trafficking; border and maritime security; cyber and intellectual property crime; countering violent extremism; digital evidence; criminal investigations; forensics; emergency communications; information systems; specialized tactical skills; corrections and prison management; academy and instructor development; organizational development; and public affairs and strategic communications. ICITAP’s impact is driven by more than 200 dedicated professionals who apply their expertise worldwide to strengthen partner institutions, disrupt criminal and terrorist networks, and directly contribute to the protection of the U.S. homeland and the advancement of broader national security objectives.
#>   changed created       date
#> 1    <NA>    <NA> 2026-01-06
#>                                                                                                                                                                                                   teaser
#> 1 On January 6, ICITAP marked its 40th anniversary – four decades of global engagement united by one mission: protecting U.S. national security through international law enforcement cooperation.&nbsp;
#>                                                                                            title
#> 1 ICITAP’s Forty Years of Global Reach, United by One Mission: Protecting U.S. National Security
#>                                                                                                                                         url
#> 1 https://www.justice.gov/criminal/criminal-icitap/blog/icitaps-forty-years-global-reach-united-one-mission-protecting-us-national-security
#>                                   uuid name
#> 1 41e21970-ae32-4402-a48e-9b1280f1f2c0 <NA>
# }
```
