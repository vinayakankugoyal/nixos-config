{ config, pkgs, ... }:

{
  home.username = "murd3rbot";
  home.homeDirectory = "/home/murd3rbot";
  home.stateVersion = "25.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Hyprland config
  xdg.configFile."hypr/hyprland.conf".source = ./configs/hyprland.conf;

  # Noctalia config
  xdg.configFile."noctalia/settings.json".source = ./configs/noctalia/settings.json;
  xdg.configFile."noctalia/colors.json".source = ./configs/noctalia/colors.json;
  xdg.configFile."noctalia/plugins.json".source = ./configs/noctalia/plugins.json;
}
