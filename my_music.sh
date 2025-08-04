#!/usr/bin/env bash

# Define terminal, no border, size and location, run vi on selected file
VIEDIT="/usr/bin/terminator -b --geometry=1100x800+400+150 -x vi"

# Define the file paths
FILE_LAST="$HOME/bin/rofi/my_music.sh"

# Set $TRM
TRM="terminator --geometry=975x600+500+200"

# Menu list
options=(
	"|-- Music Manager"
	"|-- Musikcube"
	"|-- PlayMe"
	"|-- Tunz"
	"|"
    "|-- my_music.sh"
    "|-- <<<"
)

# Use rofi to display the menu
selected=$(printf '%s\n' "${options[@]}" | rofi -theme-str 'window {width: 600;}' -dmenu -l 8 -p "$(date)")

if [[ "$selected" == "|-- Tunz" ]]; then
	$HOME/bin/rofi/my_tunz.sh
elif [[ "$selected" == "|-- Musikcube" ]]; then
    $TRM -x musikcube
elif [[ "$selected" == "|-- Music Manager" ]]; then
    python3 $HOME/bin/Python/Music_Manager/music_manager.py
elif [[ "$selected" == "|-- PlayMe" ]]; then
    python3 $HOME/bin/Python/PlayMe/playme.py
elif [[ "$selected" == "|-- my_music.sh" ]]; then
    $VIEDIT "$FILE_LAST"
elif [[ "$selected" == "|-- <<<" ]]; then
    /home/coder/bin/rofi/my_apps.sh
else
    echo "No valid option selected."
fi
