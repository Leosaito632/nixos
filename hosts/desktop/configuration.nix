{ hostName, ... }:
{
  imports = [
    ../../modules/nixos/common/system.nix
    ../../modules/nixos/common/gaming.nix
    ../../modules/nixos/amd-drivers.nix

    ./hardware-configuration.nix
  ];
  networking.hostName = hostName;
}
