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

csv_only <- function(df = FALSE) {
  tempcsv = dir(pattern=".csv", all.files = T)
  csv = map(set_names(tempcsv, tempcsv), read_csv)
  if (df) {
    list2env(csv, .GlobalEnv)
    message("All csv files are now objects")
  } 
  else {
    csv <<- csv
    message("All csv files are located in the 'csv' list object.")
  }
}

xlsx_only <- function(df = FALSE) {
  tempxlsx = dir(pattern=".xlsx", all.files = T)
  xlsx <- map(set_names(tempxlsx, tempxlsx), read_xlsx)
  if (df) {
    list2env(xlsx, .GlobalEnv) 
    message("All xlsx files are now objects")
  }
  else {
    xlsx <<- xlsx
    message("All xlsx files are located in the 'xlsx' list object.")
  }
}

import_all <- function(df = FALSE) {
  tempcsv = dir(pattern=".csv", all.files = T)
  tempxlsx = dir(pattern=".xlsx", all.files = T)
  csv <- map(set_names(tempcsv, tempcsv), read_csv)
  xlsx <- map(set_names(tempxlsx, tempxlsx), read_xlsx)
  if (df) { 
    list2env(csv, .GlobalEnv) 
    list2env(xlsx, .GlobalEnv) 
    message("All files are now listed as objects")
  }
  else {
    xlsx <<- xlsx 
    csv <<- csv
    message("All files are within their respective list objects")
  }
}