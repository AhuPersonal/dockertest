## Usage: make all

# Include the variables related with the script names, and executable commands
include config.mk

all : results/$(REPORT_NAME).md $(RAW_FILE_NAME) $(SUMMARIZED_FILE_NAME) $(PLOTPATH_NAME)_plot.pdf

## plot: Process the data/summarized_titanic.csv and saves the plots into results/titanic_plots/
$(PLOTPATH_NAME)_plot.pdf : $(SUMMARIZED_FILE_NAME) $(PLOT_SRC)
	$(PLOT_EXEC)

## data/summarized_titanic.csv: Process the data/titanic.csv and saves the result in local
$(SUMMARIZED_FILE_NAME) : $(RAW_FILE_NAME) $(SUMMARIZE_SRC)
	$(SUMMARIZE_EXEC)

## data/titanic.csv: Download from external resource saves to local
$(RAW_FILE_NAME) : $(DOWNLOAD_SRC)
	$(DOWNLOAD_EXEC)

## results/explore.md: Create report
results/$(REPORT_NAME).md: $(RAW_FILE_NAME) $(REPORT_SRC) 
	$(REPORT_EXEC)

## clean: Remove auto-generated files.
.PHONY : clean
clean :
	rm -f $(RAW_FILE_NAME)
	rm -f $(SUMMARIZED_FILE_NAME)
	rm -r results/*.*
	rm -r results/$(REPORT_NAME)

## help: Show var
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## variables   : Print variables.
.PHONY : variables
variables:
	@echo RAW_FILE_NAME: $(RAW_FILE_NAME)
	@echo SUMMARIZED_FILE_NAME: $(SUMMARIZED_FILE_NAME)
	@echo PLOTPATH_NAME: $(PLOTPATH_NAME)
	@echo DOWNLOAD_SRC: $(DOWNLOAD_SRC)
	@echo SUMMARIZE_SRC: $(SUMMARIZE_SRC)
	@echo PLOT_SRC: $(PLOT_SRC)
	@echo DOWNLOAD_URL: $(DOWNLOAD_URL)
	@echo REPORT_NAME: $(REPORT_NAME)
	@echo REPORTPATH_NAME: $(REPORTPATH_NAME)