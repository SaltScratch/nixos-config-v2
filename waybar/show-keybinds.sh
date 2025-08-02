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
    --rest=/home/$USER/.config/waybar/keybinds.txt
