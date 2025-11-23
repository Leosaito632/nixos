{
  config,
  pkgs,
  lib,
  ...
}:

{
  networking.hostName = "laptop";

  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
}
