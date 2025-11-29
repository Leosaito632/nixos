{
  inputs,
  config,
  pkgs,
  lib,
  hostName,
  ...
}:
{
  imports = [
    ./modules/home/hyprland.nix
    ./modules/home/theme.nix
    ./modules/home/programs.nix
    ./modules/home/shell.nix
    ./modules/home/desktop-shell.nix
  ];

  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;

  home.sessionVariables = {
    BROWSER = "zen";
    TERMINAL = "foot";
  };

}
