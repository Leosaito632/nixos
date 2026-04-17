{
  vars,
  pkgs,
  inputs,
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

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  xdg.configFile."qt6ct/qt6ct.conf".text = "
  [Appearance]
  icon_theme=Adwaita
  ";

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
