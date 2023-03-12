#### Preamble ####
# Purpose: Import data from the GSS
# Author: Sebastian Rodriguez, Iz Leitch, Randall Ni
# Email: me@srod.ca
# Date: 3 February 2023
# GitHub: https://github.com/seb646/happiness-and-altruism

#### Workspace set-up ####
library(foreign)
library(tidyverse)
library(dplyr)
library(here)
library(readr)

#### Convert raw data from .dat/.dct to .csv ####
#### Code originally from NORC GSS, modified 
read.dct <- function(dct, labels.included = "yes") {
      temp <- readLines(dct)
      temp <- temp[grepl("_column", temp)]
      switch(labels.included,
             yes = {
                 pattern <- "_column\\(([0-9]+)\\)\\s+([a-z0-9]+)\\s+(.*)\\s+%([0-9]+)[a-z]\\s+(.*)"
                 classes <- c("numeric", "character", "character", "numeric", "character")
                 N <- 5
                 NAMES <- c("StartPos", "Str", "ColName", "ColWidth", "ColLabel")
             },
             no = {
                 pattern <- "_column\\(([0-9]+)\\)\\s+([a-z0-9]+)\\s+(.*)\\s+%([0-9]+).*"
                 classes <- c("numeric", "character", "character", "numeric")
                 N <- 4
                 NAMES <- c("StartPos", "Str", "ColName", "ColWidth")
             })
      temp_metadata <- setNames(lapply(1:N, function(x) {
          out <- gsub(pattern, paste("\\", x, sep = ""), temp)
          out <- gsub("^\\s+|\\s+$", "", out)
          out <- gsub('\"', "", out, fixed = TRUE)
          class(out) <- classes[x] ; out }), NAMES)
      temp_metadata[["ColName"]] <- make.names(gsub("\\s", "", temp_metadata[["ColName"]]))
      temp_metadata
}

read.dat <- function(dat, metadata_var, labels.included = "yes") {
      read.fwf(dat, widths = metadata_var[["ColWidth"]], sep = "", col.names = metadata_var[["ColName"]])
}


GSS_metadata <- read.dct(here::here("inputs/data/raw/GSS.dct"))
GSS_ascii <- read.dat(here::here("inputs/data/raw/GSS.dat"), GSS_metadata)
attr(GSS_ascii, "col.label") <- GSS_metadata[["ColLabel"]]
GSS <- GSS_ascii |>
  select(BALLOT, HAPPY, GIVHMLSS, DIRECTNS, YEAR)

write_csv(
  x = GSS,
  file = here::here("inputs/data/raw/GSS.csv"),
)