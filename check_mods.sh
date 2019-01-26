#!/bin/bash

REQUIRED=$(cat Lists/required.txt)
REQ_OPTIONAL=$(cat Lists/req_optional.txt)
OPTIONAL=$(cat Lists/optional.txt)
CORE=$(cat Lists/core.txt)
PART=$(cat Lists/part.txt)
VISUAL=$(cat Lists/visual.txt)


cd ..

for I in $REQUIRED ; do
       if [ ! -e "$I" ] ; then
	       echo "Required $I is missing"
       fi
done

for I in $REQ_OPTIONAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Optionally required $I is missing"
       fi
done

for I in $CORE ; do
       if [ ! -e "$I" ] ; then
	       echo "Core $I is missing"
       fi
done

for I in $PART ; do
       if [ ! -e "$I" ] ; then
	       echo "Part mod $I is missing"
       fi
done

for I in $OPTIONAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Optional $I is missing"
       fi
done

for I in $VISUAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Visual $I is missing"
       fi
done

for I in $(ls -1) ; do
        FOUND=0
	for J in $REQUIRED $REQ_OPTIONAL $OPTIONAL $CORE $PART $VISUAL; do
		if [ "$I" = "$J" ] ; then 
			FOUND=1
		fi
	done

	if [ "$FOUND" -ne "1" ]; then 
		echo "$I is not documented properly"
	fi
done


echo "-----------------"

cd -

