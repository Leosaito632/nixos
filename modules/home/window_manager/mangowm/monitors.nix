{ hostName, ... }:

let
  monitors =
    if hostName == "desktop" then
      [
        "name:DP-1, width:1920, height:1080, refresh:144, x:0, y:0"
        "name:HDMI-A-1, width:2560, height:1080, refresh:60, x:1920, y:0"
      ]
    else
      [
        "name:eDP-1, width:1366, height:768, x:0, y:0"
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

  wayland.windowManager.mango.settings = {
    monitorrule = monitors;
  };
}
