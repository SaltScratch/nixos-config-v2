# clone repo
git clone https://github.com/giddisey/nixos-config-v2.git ~/nixos-config-v2
cd ~/nixos-config-v2 || exit

# rebuild/switch
sudo nixos-rebuild switch --flake . --impure
