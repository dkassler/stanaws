#!/bin/bash

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update -y
sudo apt-get install -y r-base
sudo Rscript -e "install.packages('rstan', repos = 'https://cloud.r-project.org')"
