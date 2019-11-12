#!/bin/bash

# Scans ModuleManager cache for TechRequired = values missing in ModuleManager.TechTree
# (quite simple and messy, slow script, don't repeat at home)

SRC="../ModuleManager.ConfigCache"
#TECH_TREE="../ModuleManager.TechTree"
TECH_TREE="000_TechTree/TechTree.cfg"

TECH_LIST=$(egrep -i "TechRequired" "$SRC" | sort -u | awk '{print $3}' | grep -v Unresearche )

#echo $TECH_LIST
for I in $TECH_LIST; do 
	grep -q "$I" "$TECH_TREE" || echo "$I is missing"
done

