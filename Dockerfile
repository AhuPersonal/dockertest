# Docker file for ubuntu-lab3
# Ahu Oral, Oct 19, 2016

# use rocker/hadleyverse as base image because of R packages
FROM rocker/hadleyverse

# install additional packages for R
RUN R -e "install.packages('gapminder', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('ezknitr', repos='http://cran.us.r-project.org')"
