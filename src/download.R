#! /usr/local/bin/env Rscript 

# download.R
# Ahu ORAL, Oct 2016
#
# This script downloads some data and save it locally. 
# It takes the following as the arguments:   
#         - URL pointing to the data.  
#         - path/filename where to write the file to and what to call it (e.g., data/data.csv)
#
# Sample Usage: Rscript src/download.R http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv data/titanic.csv


args <- commandArgs(trailingOnly = TRUE)
input_url <- args[1]
input_filename <- args[2]

library(RCurl)

#Download and output the data
download.file(input_url, input_filename)