{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./development.nix
    ./gaming.nix
    ./sddm.nix
  ];

  ####
  # BOOT
  ####

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    configurationLimit = 3;
  };

  #   fileSystems."/boot" = {
  #     device = "/";
  #     fsType = "none";
  #     options = [ "bind" ];
  #   };

  boot.tmp.cleanOnBoot = true;

  ####
  # NIX
  ####

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  ####
  # SISTEMA
  ####

  networking.networkmanager.enable = true;
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  ####
  # AUDIO
  ####

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ####
  # UTILITÁRIOS
  ####

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  ####
  # GUI
  ####

  programs.hyprland.enable = true;

  ####
  # USUÁRIO
  ####

  programs.zsh.enable = true;

  users.users.leo = {
    isNormalUser = true;
    description = "Leonardo Saito";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  ####
  # BLUETOOTH
  ####

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  ####
  # SWAP
  ####

  swapDevices = [
    {
      device = "/swapfile";
      size = 8192;
    }
  ];

  ###
  # STATE VERSION
  ###

  system.stateVersion = "25.05";
}
