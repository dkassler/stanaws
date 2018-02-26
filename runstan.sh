#!/bin/bash

arn='arn:aws-us-gov:sns:us-gov-west-1:471791317913:DLK-MPR-Alerts'

# startTime=$SECONDS
dots=`[[ ! -z "$2" ]] && echo ", $2"`

Rscript -e "library(rstan);\
options(mc.cores = parallel::detectCores());\
standata <- readRDS('$1.standata');\
fit <- stan(file = '$1.stan', data = standata$dots);\
saveRDS(fit, '$1.stanfit');\
" 2>&1 | tee $1.log

ecode=$?

#elapsedTime=$(( SECONDS - startTime ))
#durationString=`UTC0 printf '%(%H:%M:%S)T' "$elapsedTime"

if [ $ecode -eq 0 ]
then
  aws sns publish --topic-arn $arn --subject 'AWS Job Finished' --message \
    "Stan run $1 finished successfully"
else
  aws sns publish --topic-arn $arn --subject 'Error in AWS Job' --message \
    "Stan run $1 exited with error code $ecode"
fi

