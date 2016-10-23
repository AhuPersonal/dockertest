#! /usr/local/bin/env Rscript 

# generate_figures.R
# Ahu ORAL, Oct 2016
#
# Reads the data and generate some figures and save them to files
# It takes the following as the arguments:   
#         - path/filename pointing to the data
#         - a path/filename prefix where to write the figure to and what to call it (e.g., results/this_analysis)
#
# Sample Usage: Rscript src/generate_figures.R results/summarized_titanic.csv results/histogram_plots

library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
input_data <- args[1]
output_data <- args[2]

# Read data
my_data <- read.csv(input_data)

#Plot data
my_plot <- ggplot(my_data, aes(my_data["age"], fill = my_data["survived"])) + 
  geom_histogram(binwidth =5, color="black") 

#ggplot(my_data, aes(x = my_data[colx], y = my_data[coly])) + geom_point() + xlab(colx) + ylab(coly) + ggtitle(plot_title)


ggsave(filename = "plot.pdf", path = "results", plot = my_plot)