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
    DEFAULT_BROWSER = vars.browser;
    TERMINAL = vars.terminal;
    EDITOR = vars.editor;

    HYPRCURSOR_SIZE = builtins.toString vars.cursorSize;
    XCURSOR_SIZE = builtins.toString vars.cursorSize;

    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    GTK_USE_PORTAL = 1;
    # QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config = {
      hyprland = {
        # Mantém o GTK como base para coisas gerais...
        default = [ "gtk" ];

        # ...mas força o GNOME para o seletor de arquivos!
        "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
      };
    };
  };
}
