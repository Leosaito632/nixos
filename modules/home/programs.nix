{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.noctalia.homeModules.default
  ];
  # Noctalia
  programs.noctalia-shell.enable = true;

  # Browsers
  programs.firefox.enable = true;
  programs.zen-browser.enable = true;
  programs.chromium.enable = true;

  # CLI
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = ../../config/nvim;

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    # --- Dev Tools ---
    cargo
    rustc
    nodejs
    git
    gh
    vscode
    gnumake
    unzip
    ripgrep
    fd
    tree
    lua

    # --- Formatters ---
    stylua
    shfmt
    nodePackages.prettier
    nixfmt-rfc-style

    # --- CLI Utils ---
    wget
    fastfetch
    microfetch
    btop
    xclip
    wasistlos
    csvlens

    # --- Desktop Apps ---
    zapzap
    obsidian
    libreoffice-qt6-fresh
    nautilus
    pinta
    discord
    osu-lazer
    inkscape # pode ser util algum dia
    spotify

    # --- Networking ---
    openfortivpn
    openfortivpn-webview

    # --- Hyprland Core ---
    hyprland
    hypridle
    hyprpicker

    # --- System Utilities ---
    qt6Packages.qt6ct
    hyprshot
    wl-clipboard
    libnotify
    pavucontrol
    networkmanagerapplet
    power-profiles-daemon
    killall
    gparted

    # --- Fonts & Icons ---
    bibata-cursors
    adwaita-icon-theme
    adwaita-qt6

    nerd-fonts.jetbrains-mono
    font-awesome
    montserrat

    kdePackages.qtsvg

    # --- Custom Scripts ---
    (import ../../scripts/quicknote.nix { inherit pkgs; })
    (import ../../scripts/toggle_monitor.nix { inherit pkgs; })

  ];
}
