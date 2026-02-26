# Retrieve DOJ Press Releases

This function retrieves press releases from the U.S. Department of
Justice API. You can specify the number of results, search direction,
and optional keyword filtering.

## Usage

``` r
doj_press_releases(
  n_results = 50,
  search_direction = "DESC",
  keyword = NULL,
  clean = TRUE
)
```

## Arguments

- n_results:

  Integer. Number of press releases to retrieve. Default is 50.

- search_direction:

  Character. "ASC" or "DESC" for ascending or descending sort by date.
  Default is "DESC".

- keyword:

  Optional character string to filter results by keyword.

- clean:

  Logical. If TRUE, cleans up the text fields. Default is TRUE.

## Value

A cleaned dataframe containing DOJ press release metadata and content.

## Examples

``` r
# \dontrun{
# Retrieve a single DOJ press release
result <- doj_press_releases(n_results = 1)
#> Warning: There were 2 warnings in `mutate()`.
#> The first warning was:
#> ℹ In argument: `created = anydate(as.numeric(created))`.
#> Caused by warning in `anydate()`:
#> ! NAs introduced by coercion
#> ℹ Run `dplyr::last_dplyr_warnings()` to see the 1 remaining warning.
print(result)
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     body
#> 1 MONTGOMERY, Ala. – Today, Acting United States Attorney Kevin Davidson announced the sentencing of a Montgomery man for his role in a deadly shooting at a local gas station.On February 24, 2026, a federal judge sentenced Rodriques Javaun Humphrey, 20, of Montgomery, Alabama, to 480 months in prison. There is no parole in the federal system.According to court records, on January 7, 2025, officers with the Montgomery Police Department and the Alabama Law Enforcement Agency were on Zelda Road in Montgomery when they heard gunshots being exchanged between two vehicles at a nearby gas station. As officers responded, they observed three individuals fleeing the scene. Gunfire struck a fourth individual, who died at the scene.Two of the suspects ran toward an apartment complex located behind the gas station. One of those individuals, later identified as Humphrey, was carrying a rifle and a backpack and shot at responding MPD officers as he fled. Deputies with the Montgomery County Sheriff’s Office, along with an MPD K-9 unit, responded to assist in locating the fleeing suspects. One individual complied with officers’ commands and was taken into custody. Humphrey, however, continued to flee but was ultimately apprehended. Officers recovered the rifle he had been carrying.A search of Humphrey’s backpack revealed multiple plastic bags containing marijuana and a digital scale. Investigators also recovered an AR-style pistol equipped with a machinegun conversion device, causing the firearm to function as a fully automatic weapon. The serial number on the firearm had been scratched off.On August 13, 2025, Humphrey pleaded guilty to illegally possessing a machinegun, possession of a firearm with an obliterated serial number, possession with intent to distribute a controlled substance, and possession of a firearm in furtherance of a drug trafficking crime.The third individual who fled the scene,&nbsp;Ladarius Lamar Knight, ran into a fast-food restaurant across the street while armed with a firearm and was apprehended by ALEA officers. Knight previously pleaded guilty to being a felon in possession of a firearm and faces a maximum sentence of 15 years in prison.The Bureau of Alcohol, Tobacco, Firearms and Explosives (ATF), the Alabama Law Enforcement Agency (ALEA), including its Metro Area Crime Suppression (MACS) Unit, the Montgomery Police Department, and the Montgomery County Sheriff’s Office investigated this case. Assistant United States Attorney John J. Geer, III is prosecuting the case.This case is part of&nbsp;Operation Take Back America&nbsp;a nationwide initiative that marshals the full resources of the Department of Justice to repel the invasion of illegal immigration, achieve the total elimination of cartels and transnational criminal organizations (TCOs), and protect our communities from the perpetrators of violent crime.
#>   changed created       date number teaser
#> 1    <NA>    <NA> 2026-02-25   <NA>   <NA>
#>                                                                                   title
#> 1 Montgomery Man Sentenced to 40 Years in Federal Prison Following Gas Station Shooting
#>                                                                                                                    url
#> 1 https://www.justice.gov/usao-mdal/pr/montgomery-man-sentenced-40-years-federal-prison-following-gas-station-shooting
#>                                   uuid                   name
#> 1 dc458888-3637-4b1b-9ede-46b69c17ea17 USAO - Alabama, Middle
# }
```
