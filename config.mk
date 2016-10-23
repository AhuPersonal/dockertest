#File names
RAW_FILE_NAME=data/titanic.csv
SUMMARIZED_FILE_NAME=data/summarized_titanic.csv
PLOTPATH_NAME=results/titanic
REPORT_NAME=explore
REPORTPATH_NAME=results

# External URL
DOWNLOAD_URL=http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv

#Source file paths
DOWNLOAD_SRC=src/download.R
SUMMARIZE_SRC=src/summarize.R
PLOT_SRC=src/generate_figures.R
REPORT_SRC=src/$(REPORT_NAME).Rmd

#Commands to execute source files with parameters
DOWNLOAD_EXEC=Rscript $(DOWNLOAD_SRC) $(DOWNLOAD_URL) $(RAW_FILE_NAME)
SUMMARIZE_EXEC=Rscript $(SUMMARIZE_SRC) $(RAW_FILE_NAME) $(SUMMARIZED_FILE_NAME)
PLOT_EXEC=Rscript $(PLOT_SRC) $(SUMMARIZED_FILE_NAME) $(PLOTPATH_NAME)
REPORT_EXEC=Rscript -e "ezknitr::ezknit('$(REPORT_SRC)', out_dir='$(REPORTPATH_NAME)')"