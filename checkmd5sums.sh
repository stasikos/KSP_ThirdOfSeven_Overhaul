#!/bin/bash

# Checks files recoreded by buildmd5sums.sh
# yep, md5 is "insecure" but it is enough for our purpose

md5sum --quiet --check gamefiles.txt

