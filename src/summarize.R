#! /usr/local/bin/env Rscript 

# summarize.R
# Ahu ORAL, Oct 2016
#
# Reads the data from the first script, performs analysis and writes these numerical data to file in CSV or TSV format
# It takes the following as the arguments:   
#         - a path/filename pointing to the data 
#         - a path/filename where to write the file to and what to call it (e.g., results/summarized_data.csv)
#
# Sample Usage: Rscript src/summarize.R results/titanic.csv results/summarized_titanic.csv

library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
input_data <- args[1]
output_data <- args[2]

# Read data
my_data <- read.csv(input_data)

#Perform analysis and write data
summarized_data <- my_data %>%
  filter(pclass == 1 | pclass == 2) %>%
  select(pclass, survived, sex, age, fare)

write_csv(summarized_data, output_data)