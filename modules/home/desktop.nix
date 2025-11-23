{ pkgs, ... }:
{
  # Configurações de Waybar, Dunst, Scripts, etc.

  xdg.configFile."waybar".source = ../../config/waybar;
  xdg.configFile."wlogout/icons".source = ../../config/wlogout/icons;
  xdg.configFile."dunst".source = ../../config/dunst;

  services.blueman-applet.enable = true;

}
