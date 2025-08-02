# nixos-config-v2
NixOS/Hyprland flake config for my thinkpad

## Setup
- nix-shell -p git curl
- sh <(curl -L https://github.com/giddisey/nixos-config-v2/raw/main/install.sh)

## rebuilding after tweaks
- ~/nixos-config-v2/rebuild-switch.sh

## todo
- capture username, full name and email during install rather than hard code
- polkit
- idle/screen lock
- bash aliases
- apps (office, text editor, pdf viewer, image viewer/editor)

## Resources
- https://home-manager.dev/manual/23.05/index.html#ch-nix-flakes
- https://nixos.asia/en/nixos-install-flake
- https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/
- https://nixos.org/manual/nixos/stable/
- https://itsfoss.com/configure-waybar/
- https://discourse.nixos.org/t/set-up-wifi-minimal-system/8554
- https://wiki.hyprland.org/Getting-Started/Master-Tutorial/
- https://wiki.hyprland.org/Configuring/Binds/
- https://github.com/kamlendras/waybar-macos-sequoia
- https://github.com/JaKooLit/NixOS-Hyprland
