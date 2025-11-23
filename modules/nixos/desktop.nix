{
  config,
  pkgs,
  lib,
  ...
}:

{
  networking.hostName = "desktop";

  services.tlp.enable = false;
  hardware.graphics.enable = true;
}
