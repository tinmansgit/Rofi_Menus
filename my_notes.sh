#!/usr/bin/env bash

# Define terminal, no border, size and location, run vi on selected file
VIEDIT="/usr/bin/terminator -b --geometry=1100x800+400+150 -x vi"

# Define the file paths
FILE_LAST="$HOME/bin/rofi/my_notes.sh"

# Set $TRM
TRM="terminator --geometry=1200x600+400+200"

# Menu
options=(
	"|-- Note"
	"|-- Edit Note"
	"|-- ASCG Notes"
	"|"
    "|-- my_notes.sh"
    "|-- <<<"
)

# Use rofi to display the menu
selected=$(printf '%s\n' "${options[@]}" | rofi -theme-str 'window {width: 600;}' -dmenu -l 8 -p "$(date)")

if [[ "$selected" == "|-- Note" ]]; then
    $HOME/bin/Bash/Notes/my_note.sh
elif [[ "$selected" == "|-- Edit Note" ]]; then
	$TRM -x ranger /media/coder/AV/Notes/
elif [[ "$selected" == "|-- ASCG Notes" ]]; then
	$HOME/bin/rofi/my_recordings.sh
elif [[ "$selected" == "|-- my_notes.sh" ]]; then
    $VIEDIT "$FILE_LAST"
elif [[ "$selected" == "|-- <<<" ]]; then
    /home/coder/bin/rofi/my_apps.sh
else
    echo "No valid option selected."
fi
