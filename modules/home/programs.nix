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
  # programs.chromium.enable = true;

  # CLI
  programs.neovim = {
    enable = true;
    defaultEditor = true;
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
    zed-editor
    gnumake
    unzip
    ripgrep
    fd
    tree
    lua
    jetbrains.rider
    nil
    javaPackages.compiler.openjdk21

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
    # prismlauncher # Launcher de mine

    # --- Networking ---
    openfortivpn
    openfortivpn-webview

    # --- Hyprland Core ---
    hyprland
    hypridle
    hyprpicker

    # --- System Utilities ---
    kdePackages.qt6ct
    libsForQt5.qt5ct
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

    papirus-icon-theme
    adwaita-icon-theme

    nerd-fonts.jetbrains-mono
    font-awesome
    montserrat

    kdePackages.qtsvg
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum

    # --- Custom Scripts ---
    (import ../../scripts/quicknote.nix { inherit pkgs; })
    (import ../../scripts/toggle_monitor.nix { inherit pkgs; })

  ];
}
