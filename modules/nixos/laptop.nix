{
  config,
  pkgs,
  lib,
  ...
}:

{
  networking.hostName = "laptop";

  # services.tlp.enable = true;
  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
}
