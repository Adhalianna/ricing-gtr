#!/usr/bin/env bash

readonly CURRENT_THEME=$(xfconf-query -c xsettings -p /Net/ThemeName | grep -o 'morning\|noon\|evening\|night\|dark\|light')
case $CURRENT_THEME in
	morning)
		ICON="/usr/share/icons/Papirus/24x24/panel/weather-few-clouds.svg"
		NEXT_THEME=noon
		;;
	noon | light)
		ICON="/usr/share/icons/Papirus/24x24/panel/weather-clear.svg"
		NEXT_THEME=evening
		;;
	evening)
		ICON="/usr/share/icons/Papirus/24x24/panel/weather-overcast.svg"
		NEXT_THEME=night
		;;
	night | dark)
		ICON="/usr/share/icons/Papirus/24x24/panel/weather-clear-night.svg"
		NEXT_THEME=morning
		;;
esac

INFO="<img>${ICON}</img>"
INFO+="<click>theme-changer.sh ${NEXT_THEME}</click>"
echo -e "${INFO}"

MORE_INFO="<tool>"
MORE_INFO+="Current mode: ${CURRENT_THEME}\n"
MORE_INFO+="Press to change"
MORE_INFO+="</tool>"
echo -e "${MORE_INFO}"

