{
  imports = [
    ../../modules/nixos/common/system.nix

    ../../modules/nixos/intel-drivers.nix
    ../../modules/nixos/laptop.nix

    ./hardware-configuration.nix
  ];
}
