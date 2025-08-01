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
    hyprshot
  ];

  # programs
  programs.firefox.enable = true;
  programs.kitty.enable = true;

  # git
  programs.git = {
    enable = true;
    userName  = "Allan Cairns";
    userEmail = "allan@cairns.id.au";
  };

  # hyprland
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland/hyprland.conf;

  # waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  # Map dotfiles
  home.file = {
    # hyprland
    ".config/hypr/keybinds.conf".source = ./hyprland/keybinds.conf;
    # waybar
    ".config/waybar/config".source = ./waybar/config.jsonc;
    ".config/waybar/style.css".source = ./waybar/style.css;
    ".config/waybar/show-keybinds.sh".source = ./waybar/show-keybinds.sh;
  };

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
