#!/usr/bin/env bash

ORIENT="$1"

if [[ "$ORIENT" == "right" ]] ; then
    echo "Right orientation"
    # Stylus
    xsetwacom set 21 MapToOutput 1920x1080+1920+0
    xsetwacom set 21 Area 0 0 21600 13500
    # Eraser
    xsetwacom set 22 MapToOutput 1920x1080+1920+0
    xsetwacom set 21 Area 0 0 21600 13500
elif [[ "$ORIENT" == "left" ]] ; then
    echo "Left orientation"
    # Stylus
    xsetwacom set 21 MapToOutput 1920x1080+0+0
    xsetwacom set 21 Area 0 0 21600 13500
    # Eraser
    xsetwacom set 22 MapToOutput 1920x1080+0+0
    xsetwacom set 21 Area 0 0 21600 13500
fi
