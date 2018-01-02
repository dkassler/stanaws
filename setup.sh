#!/bin/bash
#setup script for ubuntu on AWS using R, Stan
strt=`date +%s`

#install R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update -y
sudo apt-get install -y r-base
sudo Rscript -e "install.packages('rstan', repos = 'https://cloud.r-project.org')"

#load my dotfiles
sudo apt install yadm
yadm clone https://github.com/dkassler/dotfiles.git
yadm checkout aws_sae

#run permissions for runRscript.sh
chmod u+x ~/stanaws/rscript.sh

end=`date +%s`
runtime=$((end-strt))
echo "Setup completed in $runtime sec wall time."

