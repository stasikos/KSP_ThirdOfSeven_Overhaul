#!/bin/bash

# Idea is to make sure game files are consistent between Dev and Production versions of game

CURRENTDIR="$(pwd)"

cd ..
find . -type f -exec md5sum {} \; | grep -av "$(basename $CURRENTDIR)" | grep -v ".log" | grep -v "AtmosphereAutopilot" >  "$CURRENTDIR/gamefiles.txt"

cd "$CURRENTDIR"

