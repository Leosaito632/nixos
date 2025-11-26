{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./modules/nixos/gaming.nix
    ./modules/nixos/development.nix
    ./modules/nixos/sddm.nix
  ];

  boot.loader.systemd-boot.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  boot.loader.grub.configurationLimit = 5;
  boot.cleanTmpDir = true;

  boot.loader.grub.extraConfig = ''
    # Remove old entries automatically
  '';

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.hyprland.enable = true;

  programs.zsh.enable = true;

  users.users.leo = {
    isNormalUser = true;
    description = "Leonardo Saito";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };

  # Habilita as regras de udev para o VIA/Keychron
  services.udev.packages = [ pkgs.via ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 8192;
    }
  ];

}
