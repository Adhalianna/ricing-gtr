#!/usr/bin/env bash

vdirsyncer sync && notify-send -a vdirsyncer -i /usr/share/icons/Papirus/128x128/apps/steadyflow.svg vdirsyncer "Synchronization successful!"

exit
