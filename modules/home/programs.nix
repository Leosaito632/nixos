{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  # Browsers
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
  programs.zen-browser.enable = true;
  # programs.chromium.enable = true;

  # CLI
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # home-manager warnings
    withPython3 = false;
    withRuby = false;
  };

  xdg.configFile."nvim".source = ../../config/nvim;

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
  };

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Leonardo Saito";
        email = "leosaito632@gmail.com";
      };
    };
  };

  home.packages = with pkgs; [
    # --- Dev Tools ---
    gcc
    cargo
    rustc
    nodejs
    gh
    zed-editor
    gnumake
    unzip
    ripgrep
    fd
    tree
    lua
    # jetbrains.rider
    nil
    javaPackages.compiler.openjdk21
    povray
    python3
    black
    processing
    vscode

    # --- Formatters ---
    stylua
    shfmt
    # nodePackages.prettier
    nixfmt

    # --- CLI Utils ---
    wget
    fastfetch
    microfetch
    btop
    xclip
    csvlens

    # --- Desktop Apps ---
    zapzap
    obsidian
    libreoffice-qt6-fresh
    nautilus
    pinta
    discord
    # osu-lazer
    # inkscape # pode ser util algum dia
    spotify
    # prismlauncher # Launcher de mine
    blender
    mendeley

    # --- Networking ---
    # openfortivpn
    # openfortivpn-webview

    # --- Hyprland Core ---
    hyprland
    hypridle
    hyprpicker
    hyprshot

    # --- System Utilities ---
    kdePackages.qt6ct
    wl-clipboard
    libnotify
    pavucontrol
    networkmanagerapplet
    power-profiles-daemon
    killall
    gparted
    gpu-screen-recorder

    # --- Fonts ---
    nerd-fonts.jetbrains-mono

    # --- Custom Scripts ---
    (import ../../scripts/quicknote.nix { inherit pkgs; })
    (import ../../scripts/toggle_monitor.nix { inherit pkgs; })

  ];
}
