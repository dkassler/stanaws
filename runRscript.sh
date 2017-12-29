#!/bin/bash

name=`expr match $1 "\(^\w\+\)\.\?"`
Rscript ${name}.R 2>&1 | tee ${name}.log

