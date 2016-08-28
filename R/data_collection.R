# library(stringr)
# library(readr)
#
# StateICP
# census_states <- read_lines(paste("https://usa.ipums.org/usa-action/",
#                                   "variables/STATEICP#codes_section",
#                                   sep = ""))
# census_states <- data.frame(census_states)
# census_states <- census_states[grep("alaska", census_states$census_states,
#                                     ignore.case = TRUE)[1],]
# census_states <- data.frame(census_states)
# census_states$census_states <- as.character(census_states$census_states)
# census_states <- as.data.frame(strsplit(census_states$census_states, ","))
# census_states <- as.data.frame(census_states[
#   -grep("general|^..id|indent|categories",
#         census_states[,1],
#         ignore.case = TRUE),])
# census_states[,1] <- gsub("^.|.$|:|.code...|.label...", "",
#                           census_states[,1], ignore.case = TRUE)
#
# states <- census_states[ !c(TRUE,FALSE), ]
# codes <- census_states[ !c(FALSE, TRUE), ]
# stateICP <- as.data.frame(cbind(codes, states))
# names(stateICP) <- c("state", "ICP_code")
# stateICP$state <- as.character(stateICP$state)
# stateICP$ICP_code <- as.character(stateICP$ICP_code)
#
# # StateFIP
# census_states <- read_lines(paste("https://usa.ipums.org/usa-action/",
#                                   "variables/STATEFIP#codes_section",
#                                   sep = ""))
# census_states <- data.frame(census_states)
# census_states <- census_states[grep("alaska", census_states$census_states,
#                                     ignore.case = TRUE)[1],]
# census_states <- data.frame(census_states)
# census_states$census_states <- as.character(census_states$census_states)
# census_states <- as.data.frame(strsplit(census_states$census_states, ","))
# census_states <- as.data.frame(census_states[
#   -grep("general|^..id|indent|categories",
#         census_states[,1],
#         ignore.case = TRUE),])
# census_states[,1] <- gsub("^.|.$|:|.code...|.label...", "",
#                           census_states[,1], ignore.case = TRUE)
#
# states <- census_states[ !c(TRUE,FALSE), ]
# codes <- census_states[ !c(FALSE, TRUE), ]
# stateFIP <- as.data.frame(cbind(codes, states))
# names(stateFIP) <- c("state", "FIP_code")
# stateFIP <- stateFIP[-52,]
# stateFIP$state <- as.character(stateFIP$state)
# stateFIP$FIP_code <- as.character(stateFIP$FIP_code)
#
# # Region
# region <- read_lines(paste("https://usa.ipums.org/",
#                            "usa-action/variables/REGION#codes_section",
#                            sep = ""))
# region <- data.frame(region)
# region <- region[grep("new england", region$region,
#                              ignore.case = TRUE)[1],]
# region <- data.frame(region)
# region$region <- as.character(region$region)
# region <- as.data.frame(strsplit(region$region, ","))
# region <- as.data.frame(region[
#   -grep("general|^..id|indent|categories|region|null|STATE UNKNOWN",
#         region[,1],
#         ignore.case = TRUE),])
# region[,1] <- gsub("^.|.$|:|.code...|.label...", "",
#                           region[,1], ignore.case = TRUE)
# region_name <- region[ !c(TRUE,FALSE), ]
# code <- region[ !c(FALSE, TRUE), ]
# region <- as.data.frame(cbind(code, region_name))
# names(region) <- c("region", "code")
# region$region <- as.character(region$region)
# region$code <- as.character(region$code)
#
# # Birthplace
# birth <- read_lines(paste("https://usa.ipums.org/usa-action/",
#                           "variables/BPL#codes_section",
#                           sep = ""))
# birth <- data.frame(birth)
# birth <- birth[grep("united", birth$birth, ignore.case = TRUE)[1],]
# birth <- data.frame(birth)
# birth$birth <- as.character(birth$birth)
# birth <- as.data.frame(strsplit(birth$birth, ","))
# birth <- as.data.frame(birth[
#   -grep("general|^..id|indent|categories|region|null|STATE UNKNOWN|^[0-9]|
#         ns",
#         birth[,1],
#         ignore.case = TRUE),])
# birth[,1] <- as.character(birth[,1])
# birth[,1] <- gsub("^.|.$|:|.code...|.label...", "",
#                    birth[,1], ignore.case = TRUE)
# birth <- as.data.frame(birth[-grep("^n.s.", birth[,1]),])
# birth <- as.data.frame(birth[-grep("Western Europe", birth[,1],
#                                    ignore.case = TRUE),])
# birth <- as.data.frame(birth[-grep("northern Europe", birth[,1],
#                                    ignore.case = TRUE),])
# birth <- as.data.frame(birth[-grep("microne", birth[,1],
#                                    ignore.case = TRUE)[1],])
# birth <- as.data.frame(birth[-grep("southern europ", birth[,1],
#                                    ignore.case = TRUE)[1],])
# birth <- as.data.frame(birth[-grep("^oceani", birth[,1],
#                                    ignore.case = TRUE)[1],])
# birth <- as.data.frame(birth[-grep("^middle east", birth[,1],
#                                    ignore.case = TRUE)[1],])
# birth <- as.data.frame(birth[-grep("^southwest", birth[,1],
#                                    ignore.case = TRUE)[1],])
# birth <- as.data.frame(birth[-grep("^caribbean", birth[,1],
#                                    ignore.case = TRUE)[1],])
# birth <- as.data.frame(birth[-grep("UNITED STATES|^ns|
# ^asia$|southeast asia|russian empire|
# baltic states|outlying areas|
# other north america|central america and|
# ^europe$|united kingdom and ireland|central/eastern europe|
# central.eastern europe|^ns$|dutch west indies|
# dutch west indies|french west indies|
# french west indies|neutral zone|
# neutral zone|west africa|^east asia$|east africa|
# east africa|melanesia|other north|^polynesia|
# ^caribbean$|^europe$|^1940|
# ^1940|^n.e.c|^nec$|^baltic states$|^asia$",
# birth[,1],
# ignore.case = TRUE),])
# birth[,1] <- gsub("^USS$", "USSR", birth[,1])
# names(birth) <- "location"
#
# birth_code <- birth[ !c(TRUE,FALSE), ]
# location <- birth[ !c(FALSE, TRUE), ]
# birth_code <- as.character(birth_code)
# location <- as.character(location)
# birth <- as.data.frame(cbind(birth_code, location))
# names(birth) <- c("code", "location")
# birth$location <- as.character(birth$location)
# birth$code <- as.character(birth$code)
