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
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            body
#> 1 Since the inauguration of President Trump, the Department of Justice is playing a critical role in Operation Take Back America, a nationwide initiative to repel the invasion of illegal immigration, achieve total elimination of cartels and transnational criminal organizations (TCOs), and protect our communities from perpetrators of violent crime. Operation Take Back America streamlines efforts and resources from the Department’s Organized Crime Drug Enforcement Task Forces (OCDETFs) and Project Safe Neighborhood (PSN).&nbsp;Last week, the U.S. Attorneys for Arizona, Central California, Southern California, New Mexico, Southern Texas, and Western Texas charged more than 960 defendants with criminal violations of U.S. immigration laws. &nbsp;The Southern District of Texas filed 257 cases in relation to immigration and border security. Of those, 98 face allegations of illegally re-entering the country with the majority having felony convictions such as narcotics, violent and/or sexual crimes and prior immigration offenses, among others. A total of 132 face charges of illegally entering the country, 23 cases involve various instances of human smuggling, and the remainder relate to firearms and other immigration matters. Among those charged as part of these new cases include two illegal alien human smugglers who engaged in a dangerous pursuit and crash.&nbsp;&nbsp;The Western District of Texas announced that federal prosecutors in the district filed 261 immigration and immigration-related criminal cases.&nbsp;&nbsp;The District of Arizona brought immigration-related criminal charges against 260 defendants. Specifically, the United States filed 96 cases in which aliens illegally re-entered the United States, and the United States also charged 155 aliens for illegally entering the United States. In its ongoing effort to deter unlawful immigration, the United States also filed nine cases against nine individuals responsible for smuggling illegal aliens into and within the District of Arizona.&nbsp;The Central District of California filed criminal charges against 20 defendants who allegedly were found in the U.S. following removal. Many of the defendants charged previously were convicted of felony offenses before they were removed from the United States, offenses that include vandalism and firearms crimes.&nbsp;The Southern District of California filed 90 border-related cases this week, including charges of transportation of illegal aliens, reentering the U.S. after deportation, deported alien found in the United States, and importation of controlled substances. In addition to reactive border-related crimes, the Southern District of California also prosecuted a significant number of proactive cases related to terrorism, organized crime, drugs, white-collar fraud, violent crime, cybercrime, human trafficking and national security. Recent developments in those and other significant areas of prosecution can be found here.&nbsp;The District of New Mexico brought the following criminal charges in New Mexico: 37 individuals were charged this week with Illegal Reentry After Deportation (8 U.S.C. 1326), six individuals were charged this week with Alien Smuggling (8 U.S.C. 1324), and 32 individuals were charged this week with Illegal Entry (8 U.S.C. 1325). In a significant case, a criminal complaint was filed against David Serrano-Dominguez, a Mexican national illegally present in the U.S., charging him with being an alien in possession of firearms, possession of an unregistered short-barrel rifle, and reentry of a deported alien. HSI agents arrested Serrano-Dominguez at an apartment complex in Deming, NM, where he had been residing. Agents had identified social media posts showing Serrano-Dominguez in possession of and discharging handguns and rifles. Following his arrest, agents discovered 10 firearms and approximately 500 rounds of ammunition in the apartment. Among the firearms was an unregistered short-barreled rifle.&nbsp;We are grateful for the hard work of our border prosecutors in bringing these cases and helping to make our border safe again.
#>   changed created       date
#> 1    <NA>    <NA> 2025-04-01
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              teaser
#> 1 Since the inauguration of President Trump, the Department of Justice is playing a critical role in Operation Take back America, a nationwide initiative to repel the invasion of illegal immigration, achieve total elimination of cartels and transnational criminal organizations (TCOs), and protect our communities from perpetrators of violent crime. Operation Take Back America streamlines efforts and resources from the Department’s Organized Crime Drug Enforcement Task Forces (OCDETFs) and Project Safe Neighborhood (PSN).&nbsp;
#>                                                                                                                                                                                         title
#> 1 U.S. Attorneys for Southwestern Border Districts Charge More than 960 Illegal Aliens with Immigration-Related Crimes During the Fourth week in March as part of Operation Take Back America
#>                                                                                                                      url
#> 1 https://www.justice.gov/opa/blog/us-attorneys-southwestern-border-districts-charge-more-960-illegal-aliens-immigration
#>                                   uuid name
#> 1 f86b9baa-df31-4067-bc1e-ea2177430960 <NA>
# }
```
