#!/usr/bin/env bash

# Define terminal, no border, size and location, run vi on selected file
VIEDIT="/usr/bin/terminator -b --geometry=1100x800+400+150 -x vi"

# Define the file paths
FILE_LAST="$HOME/bin/rofi/my_apps.sh"

# Set $TRM
TRM="terminator -b --geometry=1200x600+400+200"

# Create an array of options
options=(
	"|-- BrowseMe"
	"|-- Configs"
	"|-- Countdown Timer"
	"|-- FindMe"
	"|-- MathMe"
	"|-- Music"
	"|-- Newsboat"
	"|-- Notes"
	"|-- Ranger"
	"|-- Vinder"
	"|"
    "|-- my_apps.sh"
)

# Use rofi to display the options
selected=$(printf '%s\n' "${options[@]}" | rofi -theme-str 'window {width: 600;}' -dmenu -l 14 -p "$(date)")

if [[ "$selected" == "|-- FindMe" ]]; then
	$TRM -x $HOME/bin/Bash/MyScripts/findme.sh 
elif [[ "$selected" == "|-- Vinder" ]]; then
	$TRM -x $HOME/bin/Bash/MyScripts/vinder.sh 
elif [[ "$selected" == "|-- Ranger" ]]; then
	$TRM -x ranger
elif [[ "$selected" == "|-- Notes" ]]; then
    $HOME/bin/rofi/my_notes.sh
elif [[ "$selected" == "|-- BrowseMe" ]]; then
    python3 $HOME/bin/Python/BrowseMe/browseme.py 
elif [[ "$selected" == "|-- Newsboat" ]]; then
    $TRM -x newsboat 
elif [[ "$selected" == "|-- MathMe" ]]; then
    python3 $HOME/bin/Python/Math_Me/math-me.py
elif [[ "$selected" == "|-- Music" ]]; then
    $HOME/bin/rofi/my_music.sh
elif [[ "$selected" == "|-- Countdown Timer" ]]; then
    python3 $HOME/bin/Python/Countdown_Timer/countdown-timer.py
elif [[ "$selected" == "|-- Configs" ]]; then
	$HOME/bin/rofi/my_configs.sh
elif [[ "$selected" == "|-- my_apps.sh" ]]; then
    $VIEDIT "$FILE_LAST"
else
    echo "No valid option selected."
fi
