sudo cp -f /etc/nixos/hardware-configuration.nix .
sudo chown $USER ./hardware-configuration.nix
git add hardware-configuration.nix
sudo nixos-rebuild switch --flake .
