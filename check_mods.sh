#!/bin/bash

REQUIRED=$(cat Lists/required.txt)
REQ_OPTIONAL=$(cat Lists/req_optional.txt)
OPTIONAL=$(cat Lists/optional.txt)
RECOMMENDED=$(cat Lists/recommended.txt)
CORE=$(cat Lists/core.txt)
PART=$(cat Lists/part.txt)
PART_OPTIONAL=$(cat Lists/optional_part.txt)
VISUAL=$(cat Lists/visual.txt)
IGNORED=$(cat Lists/ignored.txt)

IFS=$'\n'


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
	       echo "Core gameplay $I is missing"
       fi
done

for I in $PART ; do
       if [ ! -e "$I" ] ; then
	       echo "Part mod $I is missing"
       fi
done

for I in $RECOMMENDED ; do
       if [ ! -e "$I" ] ; then
	       echo "Recommended $I is missing"
       fi
done

for I in $OPTIONAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Optional $I is missing"
       fi
done

for I in $PART_OPTIONAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Optional parts mod $I is missing"
       fi
done

for I in $VISUAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Visual $I is missing"
       fi
done

DIRS="$(ls -1)"

for I in $DIRS ; do
        FOUND=0
	for J in $REQUIRED $REQ_OPTIONAL $RECOMMENDED $OPTIONAL $CORE $PART $PART_OPTIONAL $VISUAL $IGNORED; do
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

