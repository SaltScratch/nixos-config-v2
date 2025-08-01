# clone repo
git clone https://github.com/giddisey/nixos-config-v2.git ~/nixos-config-v2
cd ~/nixos-config-v2 || exit

# copy hardware config
sudo cp -f /etc/nixos/hardware-configuration.nix .
sudo chown $USER ./hardware-configuration.nix
git add hardware-configuration.nix

# rebuild/switch
sudo nixos-rebuild switch --flake .
