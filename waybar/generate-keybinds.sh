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
config_file="/home/$USER/nixos-config-v2/hyprland/keybinds.conf"
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

        combo="${kbarr[0]}${kbarr[1]}"
        trimmed_combo=$(echo "$combo" | grep -o '[^[:space:]].*[^[:space:]]')
        # echo $trimmed_combo
        keybinds=$keybinds$trimmed_combo$'\n'

        action="${cm_str}"
        trimmed_action=$(echo "$action" | grep -o '[^[:space:]].*[^[:space:]]')
        # echo $trimmed_action 
        keybinds=$keybinds$trimmed_action$'\n'
    fi 
done < "$config_file"

echo "$keybinds" > /home/$USER/nixos-config-v2/waybar/keybinds.txt