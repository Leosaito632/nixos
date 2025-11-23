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
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;

    # Detecta o Windows
    useOSProber = true;

    # --- O SEGREDO DO SUCESSO ---
    # Isso diz ao GRUB: "Deixe o kernel no disco grande (/nix/store),
    # não tente espremer ele na partição de boot minúscula."
    copyKernels = lib.mkForce false;

    # Desativa imagem de fundo para economizar espaço
    splashImage = null;
  };

  boot.loader.systemd-boot.configurationLimit = 1;
  boot.initrd.compressor = "xz";

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
    ];
    shell = pkgs.zsh;
  };

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
