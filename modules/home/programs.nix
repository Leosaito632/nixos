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

  programs.firefox.enable = true;
  programs.zen-browser.enable = true;

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

  programs.swappy = {
    enable = true;
    settings = {
      Default = {
        auto_save = true;
        save_dir = "$HOME/Pictures/Screenshots";
      };
    };
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
    ungoogled-chromium
    inkscape # pode ser util algum dia

    # --- Networking ---
    openfortivpn
    openfortivpn-webview
    blueman

    # --- Hyprland Core ---
    hyprland
    hypridle
    hyprpicker

    # --- System Utilities ---
    qt6Packages.qt6ct
    hyprshot
    grim
    slurp
    wl-clipboard
    cliphist
    libnotify
    imagemagick
    pavucontrol
    playerctl
    brightnessctl
    networkmanagerapplet
    power-profiles-daemon
    killall
    gparted

    # --- Fonts & Icons ---
    bibata-cursors
    papirus-icon-theme
    nerd-fonts.jetbrains-mono
    font-awesome
    montserrat
    kdePackages.qtsvg

    # --- Custom Scripts ---
    (import ../../scripts/quicknote.nix { inherit pkgs; })
    (import ../../scripts/toggle_monitor.nix { inherit pkgs; })

  ];
}
