#!/usr/bin/env bash

pkill -9 mopidy
mopidy local scan
mopidy --config ~/.config/mopidy/mopidy.conf &
mkfifo /tmp/mpd.fifo
while : 
	do
		yes $’\n’ | nc -lu 127.0.0.1 5555 > /tmp/mpd.fifo
	done &
sleep 5
alacritty --class Ncmpcpp,Ncmpcpp -e ncmpcpp
