{ config, pkgs, noctaliaPackage, ... }:

{
  home.username = "murd3rbot";
  home.homeDirectory = "/home/murd3rbot";
  home.stateVersion = "25.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Niri config
  xdg.configFile."niri/config.kdl".source = ./configs/niri.kdl;

  # Noctalia shell with proper home-manager module
  programs.noctalia-shell = {
    enable = true;
    package = noctaliaPackage;
    systemd.enable = true;
    # Leave settings/colors/plugins at defaults - we'll manage files manually
  };

  # Manually manage config files (avoids X-Restart-Triggers bug in module)
  xdg.configFile."noctalia/settings.json".source = ./configs/noctalia/settings.json;
  xdg.configFile."noctalia/colors.json".source = ./configs/noctalia/colors.json;
  xdg.configFile."noctalia/plugins.json".source = ./configs/noctalia/plugins.json;

  # Kitty terminal
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    # Add any additional settings here as needed
    # settings = {
    #   font_size = 12;
    #   font_family = "monospace";
    # };
  };

  # VSCode extensions
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      enkia.tokyo-night
    ];
  };
}
