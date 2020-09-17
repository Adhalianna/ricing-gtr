#!/usr/bin/env bash

case $1 in
	noon | light)
		xfconf-query -c xsettings -p /Net/ThemeName -s vimix-noon-ride-compact
                xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus
		kvantummanager --set Vimix
		cat ${HOME}/.config/zathura/zathurarc-light > ${HOME}/.config/zathura/zathurarc
                xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP/workspace0/last-image -s ${HOME}/.config/wallpapers/light/01.jpg
		cat ${HOME}/.config/alacritty/alacritty-common.yml > ${HOME}/.config/alacritty/alacritty.yml ; cat ${HOME}/.config/alacritty/gtr-dark.yml >> ${HOME}/.config/alacritty/alacritty.yml
		;;
	evening)
		xfconf-query -c xsettings -p /Net/ThemeName -s vimix-evening-ride-compact
                xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Dark
		kvantummanager --set Vimix-Dark
                cat ~/.config/zathura/zathurarc-evening > ~/.config/zathura/zathurarc
                xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP/workspace0/last-image -s ${HOME}/.config/wallpapers/dark/01.jpg
                cat ${HOME}/.config/alacritty/alacritty-common.yml > ${HOME}/.config/alacritty/alacritty.yml ; cat ${HOME}/.config/alacritty/gtr-dark.yml >> ${HOME}/.config/alacritty/alacritty.yml
		;;
	night | dark)
		xfconf-query -c xsettings -p /Net/ThemeName -s vimix-night-ride-compact
                xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Dark
		kvantummanager --set Vimix-Dark-Doder
                cat ~/.config/zathura/zathurarc-night > ~/.config/zathura/zathurarc
                xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP/workspace0/last-image -s ${HOME}/.config/wallpapers/dark/01.jpg
                cat ${HOME}/.config/alacritty/alacritty-common.yml > ${HOME}/.config/alacritty/alacritty.yml ; cat ${HOME}/.config/alacritty/gtr-night.yml >> ${HOME}/.config/alacritty/alacritty.yml
		;;
	morning)
		xfconf-query -c xsettings -p /Net/ThemeName -s vimix-morning-ride-compact
                xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Light
		kvantummanager --set Vimix-Light-Doder
                cat ~/.config/zathura/zathurarc-light > ~/.config/zathura/zathurarc
                xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP/workspace0/last-image -s ${HOME}/.config/wallpapers/light/01.jpg
                cat ${HOME}/.config/alacritty/alacritty-common.yml > ${HOME}/.config/alacritty/alacritty.yml ; cat ${HOME}/.config/alacritty/gtr-light.yml >> ${HOME}/.config/alacritty/alacritty.yml
		;;
esac		
