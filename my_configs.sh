#!/usr/bin/env bash

# Define terminal, no border, size and location, run vi on selected file
VIEDIT="/usr/bin/terminator -b --geometry=1100x800+400+150 -x vi"

# Define the file paths
FILE1="$HOME/.config/rofi/config.rasi"
FILE2="$HOME/.local/share/rofi/themes/Indego.rasi"
FILE3="$HOME/.bashrc"
FILE4="$HOME/.vimrc"
FILE4a="$HOME/.profile"
FILE4b="$HOME/.config/gtk-3.0/gtk.css"
FILE5="$HOME/bin/Bash/Backup/backup_coder.sh"
FILE6="$HOME/bin/Bash/Backup/exclude_coder.txt"
FILE7="$HOME/bin/Bash/Backup/backup_460GB.sh"
FILE8="$HOME/bin/Bash/Backup/exclude_460GB.txt"
FILE9="$HOME/bin/Bash/Backup/backup_AV.sh"
FILE10="$HOME/bin/Bash/Backup/exclude_AV.txt"
FILE11="$HOME/bin/rofi/motivation.sh"
FILE99="$HOME/bin/MyHotKeys.txt"
FILE_LAST="$HOME/bin/rofi/my_configs.sh"

# Create an array of options
options=(
	"|-- crontab"
    "|-- .bashrc"
    "|-- .vimrc"
	"|-- .profile"
	"|-- gtk.css"
	"|-- motivation.sh"
	"|-- config.rasi"
    "|-- Indego.rasi"
	"|-- backup_coder.sh"
	"|-- exclude_coder.txt"
	"|-- backup_460GB.sh"
	"|-- exclude_460GB.txt"
	"|-- backup_AV.sh"
	"|-- exclude_AV.txt"
	"|-- MyHotKeys.txt"
	"|"
	"|-- Xfwm4"
	"|-- Xfwm4 Tweak"
	"|-- Xfce4 Keyboard"
	"|-- Xfce4 Desktop"
	"|-- Xfce4 Settings"
	"|"
	"|-- my_configs.sh"
	"|-- <<<"
)

# Use rofi to display the options
selected=$(printf '%s\n' "${options[@]}" | rofi -theme-str 'window {width: 600;}' -dmenu -l 26 -p "Select file to edit")

# Open the selected file with vi
if [[ "$selected" == "|-- crontab" ]]; then
    /usr/bin/terminator -b --geometry=1100x800+400+150 -x crontab -e
elif [[ "$selected" == "|-- config.rasi" ]]; then
    $VIEDIT "$FILE1"
elif [[ "$selected" == "|-- Indego.rasi" ]]; then
    $VIEDIT "$FILE2"
elif [[ "$selected" == "|-- .bashrc" ]]; then
    $VIEDIT "$FILE3"
elif [[ "$selected" == "|-- .vimrc" ]]; then
    $VIEDIT "$FILE4"
elif [[ "$selected" == "|-- .profile" ]]; then
    $VIEDIT "$FILE4a"
elif [[ "$selected" == "|-- gtk.css" ]]; then
    $VIEDIT "$FILE4b"
elif [[ "$selected" == "|-- motivation.sh" ]]; then
    $VIEDIT "$FILE4d"
elif [[ "$selected" == "|-- backup_coder.sh" ]]; then
    $VIEDIT "$FILE5"
elif [[ "$selected" == "|-- exclude_coder.txt" ]]; then
    $VIEDIT "$FILE6"
elif [[ "$selected" == "|-- backup_460GB.sh" ]]; then
    $VIEDIT "$FILE7"
elif [[ "$selected" == "|-- exclude_460GB.txt" ]]; then
    $VIEDIT "$FILE8"
elif [[ "$selected" == "|-- backup_AV.sh" ]]; then
    $VIEDIT "$FILE9"
elif [[ "$selected" == "|-- exclude_AV.txt" ]]; then
    $VIEDIT "$FILE10"
elif [[ "$selected" == "|-- MyHotKeys.txt" ]]; then
    $VIEDIT "$FILE99"
elif [[ "$selected" == "|-- Xfwm4" ]]; then
    xfwm4-settings
elif [[ "$selected" == "|-- Xfwm4 Tweak" ]]; then
    xfwm4-tweaks-settings    
elif [[ "$selected" == "|-- Xfce4 Keyboard" ]]; then
    xfce4-keyboard-settings
elif [[ "$selected" == "|-- Xfce4 Desktop" ]]; then
    xfdesktop-settings
elif [[ "$selected" == "|-- Xfce4 Settings" ]]; then
    xfce4-settings-manager
elif [[ "$selected" == "|-- my_configs.sh" ]]; then
    $VIEDIT "$FILE_LAST"
elif [[ "$selected" == "|-- <<<" ]]; then
    /home/coder/bin/rofi/my_apps.sh
else
    echo "No valid option selected."
fi
