#!/bin/bash

# Calculate total science cost to research techtree

echo -n "Science points :"
#grep "cost = " ../ModuleManager.TechTree | awk '{sum += $3} END {print sum}'
grep "cost = " 000_TechTree/TechTree.cfg | awk '{sum += $3} END {print sum}'
echo -n "Nodes: "
grep -c "cost = " 000_TechTree/TechTree.cfg

echo -n "Science points T1:"
#grep "cost = " ../ModuleManager.TechTree | awk '{sum += $3} END {print sum}'
grep "cost = " 000_TechTree/TechTree.cfg | awk '{if ($3<100) {sum += $3}} END {print sum}'

echo -n "Science points T2:"
#grep "cost = " ../ModuleManager.TechTree | awk '{sum += $3} END {print sum}'
grep "cost = " 000_TechTree/TechTree.cfg | awk '{if ($3>100 && $3<500) {sum += $3}} END {print sum}'

echo -n "Science points T3:"
#grep "cost = " ../ModuleManager.TechTree | awk '{sum += $3} END {print sum}'
grep "cost = " 000_TechTree/TechTree.cfg | awk '{if($3>500) {sum += $3}} END {print sum}'
