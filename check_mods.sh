#!/bin/bash

REQUIRED="Squad zzz_ThirdOfSeven"
REQ_OPTIONAL="SquadExpansion"
CORE="FerramAerospaceResearch ModularFlightIntegrator ModuleManager.3.1.3.dll REPOSoftTech/BackgroundResources ThunderAerospace"


cd ..

for I in $REQUIRED ; do
       if [ ! -e "$I" ] ; then
	       echo "Required $I is missing"
       fi
done

for I in $REQ_OPTIONAL ; do
       if [ ! -e "$I" ] ; then
	       echo "Required $I is missing"
       fi
done

for I in $CORE ; do
       if [ ! -e "$I" ] ; then
	       echo "Required $I is missing"
       fi
done


echo "-----------------"

cd -

