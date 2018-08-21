#!/bin/bash

# Calculate total science cost to research techtree

echo -n "Science points :"
#grep "cost = " ../ModuleManager.TechTree | awk '{sum += $3} END {print sum}'
grep "cost = " 000_TechTree/TechTree.cfg | awk '{sum += $3} END {print sum}'
echo -n "Nodes: "
grep -c "cost = " 000_TechTree/TechTree.cfg

