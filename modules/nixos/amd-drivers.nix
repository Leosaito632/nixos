{ pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable32Bit = true;
  };
}
