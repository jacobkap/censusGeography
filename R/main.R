#' United States Census Geography
#'
#' @param dataset
#' Enter a list, dataframe, or single number, that is the code for a geographic
#' area from the United States Census
#' @param type
#' Choose which geographic level the code is connected with. Options are
#' city, state FIP code, state ICP code, region, and birthplace.
#'
#' @return
#' Dataframe of two columns. The first column is the name of the location,
#' the second column is the location code (same as the input). If no match,
#' will return NA as location name
#' @export
#'
#' @examples
#' census_city_codes <- c(210, 2489, 5350, 1330)
#' censusGeography(census_city_codes, type = "city")
#'
#' # Input can be character type too
#' census_city_codes <- c("210", "2489", "5350", "1330")
#' censusGeography(census_city_codes, type = "city")
#'
#' censusGeography(42, type = "region")
#'
#' # If no match is found, will return NA for location name
#' censusGeography(0, type = "region")
#'
#' census_stateFIP_code <- data.frame(c(1,2,4), c("test", "test2", "test3"))
#' names(census_stateFIP_code) <- c("code", "character_type_column")
#' censusGeography(census_stateFIP_code$code, type = "stateFIP")
#'
#' @import qdapTools

censusGeography <- function(dataset, type = c("city", "stateFIP",
                                              "stateICP", "region",
                                              "birthplace")){

  if (! type %in% c("city", "stateFIP",
                    "stateICP", "region",
                    "birthplace")){
    stop("Error: 'type' is not in an acceptable format. Please choose again")
  }

  dataset <- as.numeric(as.character(dataset))
  dataset2 <- dataset

  if (type == "city"){

    dataset <- lookup(dataset, census_city$Code,
                      census_city$City, missing = NULL)
  }
  if (type == "stateFIP"){
    dataset <- lookup(dataset, stateFIP$FIP_code,
                      stateFIP$state, missing = NA)

  }
  if (type == "stateICP"){
    dataset <- lookup(dataset, stateICP$ICP_code,
                      stateICP$state, missing = NA)
  }
  if (type == "region"){
    dataset <- lookup(dataset, census_region$code,
                      census_region$region, missing = NA)
  }
  if (type == "birthplace"){
    dataset <- lookup(dataset, birthplace_census$code,
                      birthplace_census$location, missing = NA)
  }
  dataset <- data.frame(dataset)
  dataset$second <- dataset2
  names(dataset)[1] <- type
  names(dataset)[2] <- "code"
  return(dataset)
}

#' Census code and city name for City geographies
#'
#' A dataset containing the code and city name for every city included in the
#' US Census.
#'
#' @format A data frame with 1168 rows and 3 variables:
#' \describe{
#'   \item{Code}{Census code for the city}
#'   \item{City}{Name of the city corresponding with the code}
#'   \item{State}{Name of the state that the city is in}
#'   ...
#' }
#' @source \url{https://usa.ipums.org/usa-action/variables/CITY#codes_section}
"census_city"

#' Census code and state name for Census State FIP geographies
#'
#' A dataset containing the code and state name for every state included in the
#' US Census State FIP list.
#'
#' @format A data frame with 62 rows and 2 variables:
#' \describe{
#'   \item{state}{Name of the state corresponding with the code}
#'   \item{FIP_code}{Census FIP code for the state}
#'   ...
#' }
#' @source \url{https://usa.ipums.org/usa-action/variables/STATEFIP#codes_section}
"stateFIP"

#' Census code and state name for Census State ICP geographies
#'
#' A dataset containing the code and state name for every state included in the
#' US Census State ICP list.
#'
#' @format A data frame with 55 rows and 2 variables:
#' \describe{
#'   \item{state}{Name of the state corresponding with the code}
#'   \item{ICP_code}{Census ICP code for the state}
#'   ...
#' }
#' @source \url{https://usa.ipums.org/usa-action/variables/STATEICP#codes_section}
"stateICP"

#' Census code and region name for Census region geographies
#'
#' A dataset containing the code and region name for every region included in the
#' US Census region list.
#'
#' @format A data frame with 17 rows and 2 variables:
#' \describe{
#'   \item{region}{Name of the region corresponding with the code}
#'   \item{code}{Census code for the region}
#'   ...
#' }
#' @source \url{https://usa.ipums.org/usa-action/variables/REGION#codes_section}
"census_region"

#' Census code and location name for Census birthplace locations
#'
#' A dataset containing the code and location name for every
#' location included in the US Census birthplace list.
#'
#' @format A data frame with 533 rows and 2 variables:
#' \describe{
#'   \item{code}{Census code for the birthplace}
#'   \item{location}{Name of the state, county, or region
#'    corresponding with the code}
#'   ...
#' }
#' @source \url{https://usa.ipums.org/usa-action/variables/BPL#codes_section}
"birthplace_census"
