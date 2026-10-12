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
  tag_rule =
    if hostName == "desktop" then
      [
        "id:1, monitor_name:DP-1,no_hide:1"
        "id:2, monitor_name:DP-1,no_hide:1"
        "id:3, monitor_name:DP-1,no_hide:1"
        "id:4, monitor_name:DP-1,no_hide:1"
        "id:5, monitor_name:DP-1,no_hide:1"
        "id:6, monitor_name:HDMI-A-1,no_hide:1"
        "id:7, monitor_name:HDMI-A-1,no_hide:1"
        "id:8, monitor_name:HDMI-A-1,no_hide:1"
        "id:9, monitor_name:HDMI-A-1,no_hide:1"
        "id:10, monitor_name:HDMI-A-1,no_hide:1"
      ]
    else
      [
        "id:1, monitor_name:eDP-1, no_hide:1"
        "id:2, monitor_name:eDP-1, no_hide:1"
        "id:3, monitor_name:eDP-1, no_hide:1"
        "id:4, monitor_name:eDP-1, no_hide:1"
        "id:5, monitor_name:eDP-1, no_hide:1"
        "id:6, monitor_name:eDP-1, no_hide:1"
        "id:7, monitor_name:eDP-1, no_hide:1"
        "id:8, monitor_name:eDP-1, no_hide:1"
        "id:9, monitor_name:eDP-1, no_hide:1"
        "id:10, monitor_name:eDP-1, no_hide:1"
      ];
in
{

  wayland.windowManager.mango.settings = {
    monitor_rule = monitors;
    tag_rule = tag_rule;
  };
}
