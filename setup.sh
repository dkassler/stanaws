#!/bin/bash
#setup script for ubuntu on AWS using R, Stan
strt=`date +%s`

source install_R.sh
source get_dotfiles.sh

end=`date +%s`
runtime=$((end-strt))
echo "Setup completed in $runtime sec wall time."

