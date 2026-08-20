{
  imports = [
    ../../modules/nixos/common/system.nix
    ../../modules/nixos/common/gaming.nix

    ../../modules/nixos/amd-drivers.nix
    ../../modules/nixos/desktop.nix

    ./hardware-configuration.nix
  ];
}
