{ config, inputs, ... }:
{
  # Configurações de Waybar, Dunst, Scripts, etc.
  xdg.configFile."waybar".source = ../../config/waybar;
  xdg.configFile."wlogout/icons".source = ../../config/wlogout/icons;
  xdg.configFile."dunst".source = ../../config/dunst;

  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/noctalia";
}
