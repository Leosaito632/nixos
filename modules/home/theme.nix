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
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.bibata-cursors;

    name = vars.cursorTheme;
    size = vars.cursorSize;
  };

  # Temas da interface grafica
  gtk = {
    enable = true;

    # home-manager warnings
    gtk4 = {
      theme = null;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
  xdg.configFile."qt6ct/qt6ct.conf".source = ../../config/qt6ct/qt6ct.conf;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=KvGnomeDark
  '';

  # Fonte do Sistema
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    serif = [ "JetBrainsMono Nerd Font" ];
    sansSerif = [ "JetBrainsMono Nerd Font" ];
  };
}
