#!/bin/bash
#  _              _     _           _ _                  
# | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___  
# | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __| 
# |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \ 
# |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/ 
#           |___/                             |___/      
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Path to keybindings config file
# ----------------------------------------------------- 
config_file="/home/$USER/.config/hypr/keybinds.conf"
echo "Reading from: $config_file"

keybinds=""

# Detect Start String
while read -r line
do
    if [[ "$line" == "bind"* ]]; then

        line="$(echo "$line" | sed 's/$mod/SUPER/g')"
        line="$(echo "$line" | sed 's/bind = //g')"
        line="$(echo "$line" | sed 's/bindm = //g')"
        line="$(echo "$line" | sed 's/bindd = //g')"

        IFS="#" 
        read -a strarr <<< "$line" 
        kb_str=${strarr[0]}
        cm_str=${strarr[1]}

        IFS="," 
        read -a kbarr <<<"$kb_str" 

        item="\"${kbarr[0]}${kbarr[1]}\" \"${cm_str}\""
        #echo $item 
        keybinds=$keybinds$item$'\n'
    fi 
done < "$config_file"

sleep 0.2
#echo "$keybinds"
#wofi --dmenu -p "Keybinds" <<< "$keybinds"
#yad --no-buttons --column=Key --column=Description $keybinds

# Launch yad
GDK_BACKEND=wayland yad \
    --center \
    --title="Cheat Sheet" \
    --no-buttons \
    --list \
    --width=600\
    --height=600\
    --column=Key \
    --column=Command \
    --timeout-indicator=bottom \
"ESCAPE" "close this window" \
"CTRL ALT Delete" "exit hyprland" \
"SUPER SPACE" "app launcher" \
"SUPER Q" "kill active window" \
"SUPER RETURN" "launch terminal" \
"SUPER M" "swap active window with master" \
"SUPER mouse:272" "move window" \
"SUPER mouse:273" "resize window" \
"SUPER 1" "go to workspace 1" \
"SUPER 2" "go to workspace 2" \
"SUPER 3" "go to workspace 3" \
"SUPER 4" "go to workspace 4" \
"SUPER left" "go to previous workspace" \
"SUPER right" "go to next workspace" \
"SUPER CTRL 1" "move window to workspace 1 and go there" \
"SUPER CTRL 2" "move window to workspace 2 and go there" \
"SUPER CTRL 3" "move window to workspace 3 and go there" \
"SUPER CTRL 4" "move window to workspace 4 and go there" \
"SUPER CTRL left" "move window to previous workspace and go there" \
"SUPER CTRL right" "move window to next workspace and go there" \
"SUPER SHIFT 1" "move window to workspace 1" \
"SUPER SHIFT 2" "move window to workspace 2" \
"SUPER SHIFT 3" "move window to workspace 3" \
"SUPER SHIFT 4" "move window to workspace 4" \
"SUPER F" "toggle floating/tiling" \
"PRINT" "screenshot full screen and save" \
"CTRL PRINT" "screenshot window and save" \
"SHIFT PRINT" "screenshot region and save" \
"SUPER PRINT" "screenshot full screen to clipboard" \
"SUPER CTRL PRINT" "screenshot window to clipboard" \
"SUPER SHIFT PRINT" "screenshot region to clipboard" \
