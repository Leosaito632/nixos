{ ... }:
{
  imports = [
    ../../modules/nixos/common/system.nix
    ../../modules/nixos/intel-drivers.nix

    ./hardware-configuration.nix
  ];
  networking.hostName = "laptop";

  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  programs.steam.enable = true;

}
