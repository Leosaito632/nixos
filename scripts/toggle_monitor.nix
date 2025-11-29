{ pkgs }:

pkgs.writeShellScriptBin "toggle_monitor" ''
  MONITOR="HDMI-A-1"
  if hyprctl monitors | grep "$MONITOR"; then
      hyprctl keyword monitor "$MONITOR, disable"
  else
      hyprctl keyword monitor "$MONITOR, preferred, auto, 1"
  fi''
