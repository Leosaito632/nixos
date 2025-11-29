{ hostName, ... }:

let
  # Definição dos monitores baseada no hostname
  monitors =
    if hostName == "desktop" then
      [
        "DP-1, 1920x1080@144, 0x0, 1"
        "HDMI-A-1, 2560x1080@144, 1920x0, 1"
        ", preferred, auto, 1"
      ]
    else
      [
        "eDP-1, 1366x768, 0x0, 1"
        ", preferred, auto, 1"
      ];

  # Mapeamento dos workspaces
  workspaces =
    if hostName == "desktop" then
      [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:HDMI-A-1"
        "7, monitor:HDMI-A-1"
        "8, monitor:HDMI-A-1"
        "9, monitor:HDMI-A-1"
        "10, monitor:HDMI-A-1"
      ]
    else
      [
        "1, monitor:eDP-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
        "9, monitor:eDP-1"
        "10, monitor:eDP-1"
      ];
in
{
  wayland.windowManager.hyprland.settings = {
    monitor = monitors;
    workspace = workspaces;
  };
}
