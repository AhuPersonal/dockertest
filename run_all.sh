# This script executes the scripts below:
# 1. download.R - Downloads data file from external resource and save it to /data/{filename}.
# 2. summarize.R - Summarizes the downloaded file, and generate additional data file /data/summarized_{filename}.
# 3. generate_figures.R - Generate plots under results/plots_{filename}/ folder.
#
# Sample usage:
# bash run_all.sh
#
# Description:
# It downloads the http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv file into data/titanic.csv
# Run summarize script on raw data, exports to data/summarized_titanic.csv
# Run plots on summarized data, exports to results/titanic
# Export md, pdf, html report from Rmd script into results/ directory

# Download the data from external source and save it to local file
Rscript src/download.R http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv data/titanic.csv

# Summarize the downloaded data and save it to another local file
Rscript src/summarize.R data/titanic.csv data/summarized_titanic.csv

# Draw plots from given summarized data
Rscript src/generate_figures.R data/summarized_titanic.csv results/titanic

# Create reports figures from explore.Rmd
Rscript -e "ezknitr::ezknit('src/explore.Rmd', out_dir='results')"