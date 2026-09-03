{ pkgs }:

pkgs.writeShellScriptBin "toggle_monitor" ''
  MONITOR="HDMI-A-1"
  mmsg dispatch toggle_monitor,$MONITOR
''
