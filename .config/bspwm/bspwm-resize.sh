#!/bin/bash

[ "$#" -eq 2 ] || { echo "Needs exactly two arguments."; exit 1; }

motion="$1"
size="$2"

if [ "$motion" = 'expand' ]; then
	bspc node -z top 0 -"$size"
	bspc node -z right "$size" 0
	bspc node -z bottom 0 "$size"
	bspc node -z left -"$size" 0
else
	bspc node -z top 0 "$size"
	bspc node -z right -"$size" 0
	bspc node -z bottom 0 -"$size"
	bspc node -z left "$size" 0
fi
