#!/usr/bin/env bash

# Define terminal, no border, size and location, run vi on selected file
VIEDIT="/usr/bin/terminator -b --geometry=1100x800+400+150 -x vi"

# Define the file paths
FILE_LAST="$HOME/bin/rofi/my_recordings.sh"

# Create an array of options
options=(
	"|-- Load Rack"
	"|-- Audio Note"
	"|-- Audio + Screen Note"
	"|-- Audio + Screen + Cam Note"
	"|-- Audio + Screen + Cam + Guitar Note"
	"|"
    "|-- my_recordings.sh"
    "|-- <<<"
)

# Use rofi to display the options
selected=$(printf '%s\n' "${options[@]}" | rofi -theme-str 'window {width: 600;}' -dmenu -l 8 -p "Choose A/V Recording Script")

if [[ "$selected" == "|-- Load Rack" ]]; then
	/home/coder/bin/Bash/Startups/pod_startup.sh
elif [[ "$selected" == "|-- Audio Note" ]]; then
    /home/coder/bin/Bash/Audio/audio.sh
elif [[ "$selected" == "|-- Audio + Screen Note" ]]; then
    /home/coder/bin/Bash/Audio+Screen/audio+screen.sh
elif [[ "$selected" == "|-- Audio + Screen + Cam Note" ]]; then
    /home/coder/bin/Bash/Audio+Screen+Cam/audio+screen+cam.sh
elif [[ "$selected" == "|-- Audio + Screen + Cam + Guitar + Note" ]]; then
    /home/coder/bin/Bash/Audio+Screen+Cam+Guitar/audio+screen+cam+guitar.sh
elif [[ "$selected" == "|-- my_recordings.sh" ]]; then
    $VIEDIT "$FILE_LAST"
elif [[ "$selected" == "|-- <<<" ]]; then
    /home/coder/bin/rofi/my_apps.sh
else
    echo "No valid option selected."
fi
