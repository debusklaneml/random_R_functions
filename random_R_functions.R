# random R functions for tentative R packages. 

library(tidyverse)
library(janitor)
library(readxl)
library(tidylog)

#Files----


tempcsv = dir(pattern=".csv", all.files = T)
tempxlsx = dir(pattern=".xlsx", all.files = T)
csv <- map(set_names(tempcsv, tempcsv), read_csv)
xlsx <- map(set_names(tempxlsx, tempxlsx), read_xlsx)


list2env(csv, .GlobalEnv)
list2env(xlsx, .GlobalEnv)

# import <- function(file_type = c("csv", "xlsx", "all")) {
#   
# }
# 
# import_all_csv <- function() {
#   tempcsv = dir(pattern=".csv", all.files = T)
#   csv = map(set_names(tempcsv, tempcsv), read_csv)
#   csv <<- csv
# }
# 
# test_fun <- function(df = FALSE) {
#   tempcsv = dir(pattern=".csv", all.files = T)
#   csv = map(set_names(tempcsv, tempcsv), read_csv)
#   if (df) list2env(csv, .GlobalEnv)
#   else
#     csv <<- csv
# }

csv_only <- function(df = FALSE) {
  tempcsv = dir(pattern=".csv", all.files = T)
  csv = map(set_names(tempcsv, tempcsv), read_csv)
  if (df) list2env(csv, .GlobalEnv)
  else
    csv <<- csv
}

xlsx_only <- function(df = FALSE) {
  tempxlsx = dir(pattern=".xlsx", all.files = T)
  xlsx <- map(set_names(tempxlsx, tempxlsx), read_xlsx)
  if (df) list2env(xlsx, .GlobalEnv)
  else
    xlsx <<- xlsx
}

import_all <- function(df = FALSE) {
  tempcsv = dir(pattern=".csv", all.files = T)
  tempxlsx = dir(pattern=".xlsx", all.files = T)
  csv <- map(set_names(tempcsv, tempcsv), read_csv)
  xlsx <- map(set_names(tempxlsx, tempxlsx), read_xlsx)
  if (df) list2env(csv, .GlobalEnv) & list2env(xlsx, .GlobalEnv)
  else
    xlsx <<- xlsx
    csv <<- csv
}