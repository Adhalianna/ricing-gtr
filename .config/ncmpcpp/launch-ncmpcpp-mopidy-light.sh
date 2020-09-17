#!/usr/bin/env bash

# Use lower bitrate for Spotify (= "Normal Quality") and minimal UI and disable youtube
# The not-light version of configs for mopidy uses "Very High Quality"!
# Save your data transfer

pkill -9 mopidy
mopidy --config ~/.config/mopidy/mopidy.light.conf &
sleep 5
alacritty --class Ncmpcpp,Ncmpcpp -e ncmpcpp -c ~/.config/ncmpcpp/config.light

