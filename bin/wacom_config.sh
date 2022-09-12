#!/usr/bin/env bash

ORIENT="$1"

if [[ "$ORIENT" == "right" ]]; then
    echo "Right orientation"
    # Stylus
    xsetwacom set 12 MapToOutput 1920x1080+1920+0
    xsetwacom set 12 Area 0 0 21600 13500
    xsetwacom set 12 Rotate half
    # Eraser
    xsetwacom set 20 MapToOutput 1920x1080+1920+0
    xsetwacom set 20 Area 0 0 21600 13500
    xsetwacom set 20 Rotate half
elif [[ "$ORIENT" == "left" ]]; then
    echo "Left orientation"
    # Stylus
    xsetwacom set 12 MapToOutput 1920x1080+0+0
    xsetwacom set 12 Area 0 0 21600 13500
    xsetwacom set 12 Rotate half
    # Eraser
    xsetwacom set 20 MapToOutput 1920x1080+0+0
    xsetwacom set 20 Area 0 0 21600 13500
    xsetwacom set 20 Rotate half
fi
