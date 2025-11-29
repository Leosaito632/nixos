{
  pkgs,
  lib,
  hostName,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Links dos arquivos
  xdg.configFile."hypr/hyprland.conf".source = ../../config/hypr/hyprland.conf;
  xdg.configFile."hypr/keybindings.conf".source = ../../config/hypr/keybindings.conf;
  xdg.configFile."hypr/windowrules.conf".source = ../../config/hypr/windowrules.conf;
  xdg.configFile."hypr/hypridle.conf".source = ../../config/hypr/hypridle.conf;

  # Monitor dinâmico
  xdg.configFile."hypr/monitors.conf".source =
    if hostName == "desktop" then
      ../../config/hypr/monitors-desktop.conf
    else
      ../../config/hypr/monitors-laptop.conf;
}
