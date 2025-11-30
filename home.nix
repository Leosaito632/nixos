{
  inputs,
  config,
  pkgs,
  lib,
  hostName,
  vars,
  ...
}:
{
  imports = [
    ./modules/home/hyprland
    ./modules/home/theme.nix
    ./modules/home/programs.nix
    ./modules/home/shell.nix
    ./modules/home/desktop-shell.nix
    ./modules/home/opener.nix

  ];

  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;

  home.sessionVariables = {
    BROWSER = vars.browser;
    TERMINAL = vars.terminal;
    EDITOR = vars.editor;

    HYPRCURSOR_SIZE = builtins.toString vars.cursorSize;
    XCURSOR_SIZE = builtins.toString vars.cursorSize;

    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    # QT_QPA_PLATFORMTHEME = "qt6ct";

  };

}
