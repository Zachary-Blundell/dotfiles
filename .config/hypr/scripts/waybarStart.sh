#!/bin/bash

# Check if Waybar is already running
if pgrep -x "waybar" > /dev/null
then
  pkill waybar
  sleep 3
  waybar &
else
  # Start Waybar
  waybar --bar main-bar --log-level error --config ${CONFIG} --style ${STYLE} 
fi

