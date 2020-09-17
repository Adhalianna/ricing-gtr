#!/usr/bin/env bash
# Dependencies: bash>=3.2, playerctl, xfce4-genmon-plugin>=3.99

# Makes the script more portable
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Dependencies: xdotool, desknamer, xfwm4, xfconf-query
# An utility for obtaining current workspace name
function get_workspace_name {
	local wkspace_index=`xdotool get_desktop`
	local wkspace_num=$(($wkspace_index+1))
	local result_cut=$(($wkspace_num+2))
	local workspace_name=`xfconf-query -c xfwm4 -p /general/workspace_names | head -$result_cut | tail -1`
	echo "$workspace_name"
}



readonly MAX_CHARS=30



# Use playerctl exit status to verify if any compatible player is running
if playerctl status > /dev/null
then
	# Optional icon to display before the text
	# Insert the absolute path of the icon
	# Recommended size is 24x24 px
	readonly ICON="/usr/share/icons/Papirus/24x24/panel/banshee-panel.svg"

	# Song's info
	readonly ARTIST=$(playerctl metadata artist)
	readonly TITLE=$(playerctl metadata title)
	readonly ALBUM=$(playerctl metadata album)
	ARTIST_TITLE=$(echo "${ARTIST} - ${TITLE}")

	# Command chaining in xdotool does not work as expected hence WIN_ID variable was added
	# Warning! Some characters in song titles will cause no match when searching for window
	readonly WIN_ID=$(xdotool search --limit 1 --name "${TITLE}")                      

	# Proper length handling                              
	readonly STRING_LENGTH="${#ARTIST_TITLE}"
	readonly CHARS_TO_REMOVE=$(( STRING_LENGTH - MAX_CHARS ))
	[ "${#ARTIST_TITLE}" -gt "${MAX_CHARS}" ] \
	  && ARTIST_TITLE="${ARTIST_TITLE:0:-CHARS_TO_REMOVE}…"

	# Panel
	if [[ $(file -b "${ICON}") =~ PNG|SVG ]]; then
	  INFO="<img>${ICON}</img>"
	  INFO+="<txt>"
	  INFO+=" "
	  INFO+="${ARTIST_TITLE}"
	  INFO+="</txt>"
	else 
	  INFO="<txt>"
	  INFO+="${ARTIST_TITLE}"
	  INFO+="</txt>"
	fi

	# Actions performed after clicking icon and text
	INFO+="<click>xdotool windowactivate ${WIN_ID}</click>"
	INFO+="<txtclick>playerctl -a play-pause</txtclick>"

	# Tooltip
	MORE_INFO="<tool>"
	MORE_INFO+="Artist: ${ARTIST}\n"
	MORE_INFO+="Album: ${ALBUM}\n"
	MORE_INFO+="Title: ${TITLE}"
	MORE_INFO+="</tool>"

	# Panel Print
	echo -e "${INFO}"

	# Tooltip Print
	echo -e "${MORE_INFO}"

	exit

# Dependencies: vdirsyncer, icalendar_light (pip), a script running synchronization with vdirsyncer
elif [ $(get_workspace_name) == "" ]
then
        readonly ICON="/usr/share/icons/Papirus/24x24@2x/panel/mini-calendar.svg"

        EVENT=$(icalendar_light upcoming --days 360 ~/.config/orage/calendars/grzybek.mikolaj@gmail.com.ics | cut -d" " -f1,3,4 --complement | sed 's/\+[0-9].*[0-9]//g' | awk -F\  ' { if ( $1 ~ /^0[0:]*0$/ ) { $1=""; $2="-"; print "whole day",$0; } else { $2="-"; print $0;} }' | sed 's/\s*\s/ /g')
	readonly CHARS_TO_REMOVE=$(( STRING_LENGTH - MAX_CHARS ))
        [ "${#EVENT}" -gt "${MAX_CHARS}" ] \
          && EVENT="${EVENT:0:-CHARS_TO_REMOVE}…"



        MORE_INFO="<tool>"
        MORE_INFO+="Click text to sync calendars with vdirsyncer."
        MORE_INFO+="</tool>"

        INFO="<img>${ICON}</img>"
        INFO+="<txt>"
	INFO+="${EVENT}"
	INFO+="</txt>"
	INFO+="<txtclick>${HOME}/.config/vdirsyncer/run_and_confirm.sh</txtclick>"
	INFO+="<click>alacritty --class Dijo,Dijo -e dijo</click>"

	echo -e "${INFO}"
	echo -e "${MORE_INFO}"

	exit

else
	# When no player found print nothing to the panel
	INFO="<txt></txt>"
	MORE_INFO="<tool></tool>"
	echo -e "${INFO}"
	echo -e "${MORE_INFO}"

	exit
fi

