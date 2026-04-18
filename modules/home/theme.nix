{
  vars,
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.file."Pictures/Wallpapers".source = ../../Backgrounds;

  # Mouse pointer cursor theme
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = vars.cursorTheme;
    size = vars.cursorSize;
  };

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;

    gtk4.theme = null;

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  # Fonte do Sistema
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    serif = [ "JetBrainsMono Nerd Font" ];
    sansSerif = [ "JetBrainsMono Nerd Font" ];
  };

  # Portals
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
    config = {
      hyprland = {
        # FileChooser do gnome (Nautilus)
        "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
      };
    };
  };
}
