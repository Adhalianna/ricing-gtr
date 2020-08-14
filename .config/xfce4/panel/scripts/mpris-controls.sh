#!/usr/bin/env bash
# Dependencies: bash>=3.2, playerctl, xfce4-genmon-plugin>=3.99

# Makes the script more portable
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Use playerctl exit status to verify if any compatible player is running
if playerctl status > /dev/null
then
	# Optional icon to display before the text
	# Insert the absolute path of the icon
	# Recommended size is 24x24 px
	readonly ICON="/usr/share/icons/Tela/24/panel/banshee-panel.svg"

	# Song's info
	readonly ARTIST=$(playerctl metadata artist)
	readonly TITLE=$(playerctl metadata title)
	readonly ALBUM=$(playerctl metadata album)
	ARTIST_TITLE=$(echo "${ARTIST} - ${TITLE}")

	# Command chaining in xdotool does not work as expected hence WIN_ID variable was added
	# Warning! Some characters in song titles will cause no match when searching for window
	readonly WIN_ID=$(xdotool search --limit 1 --name "${TITLE}")                      

	# Proper length handling                              
	readonly MAX_CHARS=30
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
	MORE_INFO+="Title: ${TITLE}\n"
	MORE_INFO+="\nIcon: focus player window | Text: play-pause"
	MORE_INFO+="</tool>"

	# Panel Print
	echo -e "${INFO}"

	# Tooltip Print
	echo -e "${MORE_INFO}"
else
	# When no player found print nothing to the panel
	INFO="<txt></txt>"
	MORE_INFO="<tool></tool>"
	echo -e "${INFO}"
	echo -e "${MORE_INFO}"
fi

