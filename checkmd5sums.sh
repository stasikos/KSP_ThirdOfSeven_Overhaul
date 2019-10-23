#!/bin/bash

# Checks files recoreded by buildmd5sums.sh
# yep, md5 is "insecure" but it is enough for our purpose

MODDIR=$(basename `pwd`)
cd ..
md5sum --quiet --check $MODDIR/gamefiles.txt
cd -
