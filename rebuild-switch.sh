sudo cp -f /etc/nix/hardware-configuration.nix .
sudo chown $USER ./hardware-configuration.nix
sudo nixos-rebuild switch --flake .
