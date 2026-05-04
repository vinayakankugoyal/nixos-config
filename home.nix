{ config, pkgs, ... }:

{
  home.username = "murd3rbot";
  home.homeDirectory = "/home/murd3rbot";
  home.stateVersion = "25.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Allow unfree packages for nix-shell and other user-level Nix commands
  nixpkgs.config.allowUnfree = true;

  # Niri config
  xdg.configFile."niri/config.kdl".source = ./configs/niri.kdl;

  # Noctalia shell config files
  xdg.configFile."noctalia/settings.json".source = ./configs/noctalia/settings.json;
  xdg.configFile."noctalia/colors.json".source = ./configs/noctalia/colors.json;
  xdg.configFile."noctalia/plugins.json".source = ./configs/noctalia/plugins.json;

  # Swaylock config
  xdg.configFile."swaylock/config".source = ./configs/swaylock/config;

  # Kitty terminal
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    settings = {
      shell = "tmux";
    };
  };

  # VSCode extensions
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = [
        "--enable-features=WaylandWindowDecorations"
        "--ozone-platform-hint=auto"
      ];
    };
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      enkia.tokyo-night
    ];
  };

  # Tmux configuration
  programs.tmux = {
    enable = true;
    keyMode = "vi";
  };

  # Git configuration
  programs.git = {
    enable = true;
    userEmail = "vinayakankugoyal@gmail.com";
    userName = "Vinayak Goyal";
    extraConfig = {
      core.editor = "vim";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
