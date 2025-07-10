{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "allan";
  home.homeDirectory = "/home/allan";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [                               
    btop
    font-awesome
    gh
    git
    killall
    mc
    neofetch
    nextcloud-client
    wofi
    thunderbird
    vscodium-fhs
  ];

  # programs
  programs.firefox.enable = true;
  programs.kitty.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
