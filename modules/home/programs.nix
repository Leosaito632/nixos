{ pkgs, inputs, ... }:
{
  imports = [
    # ../../config/rofi/rofi.nix
    # ../../config/wlogout/wlogout.nix
    inputs.zen-browser.homeModules.twilight
  ];

  programs.firefox.enable = true;
  programs.zen-browser.enable = true;
  programs.foot.enable = true;
  programs.alacritty.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = ../../config/nvim;

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
    yazi

    # --- Desktop Apps ---
    zapzap
    obsidian
    libreoffice-qt6-fresh
    nautilus
    pinta
    discord
    osu-lazer
    ungoogled-chromium

    # --- Networking ---
    openfortivpn
    openfortivpn-webview
    blueman

    # --- Hyprland Core ---
    hyprland
    hyprlock
    hypridle
    hyprpicker

    # --- Desktop Interface ---
    waybar
    dunst
    wlogout
    swww

    # --- System Utilities ---
    hyprshot
    grim
    slurp
    swappy
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

    # --- Custom Scripts ---
    (import ../../scripts/wallsetter.nix { inherit pkgs; })
    (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ../../scripts/screenshootin.nix { inherit pkgs; })
    (import ../../scripts/list-hypr-bindings.nix { inherit pkgs; })
    (import ../../scripts/quicknote.nix { inherit pkgs; })
  ];
}
