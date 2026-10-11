{
  lib,
  pkgs,
  inputs,
  config,
  hostName,
  ...
}:
let
  uniqueApps =
    if hostName == "desktop" then
      with pkgs;
      [
        osu-lazer
        spotify
        prismlauncher
        discord
        orca-slicer
        stoat-desktop
        pkgsRocm.blender
        claude-code
      ]
    else
      with pkgs;
      [
        power-profiles-daemon
        blender
      ];
in
{
  imports = [
    ./programs/editor.nix
    ./programs/browser.nix
  ];

  # CLI
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
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

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages =
    with pkgs;
    [
      # Gera Gerall
      # --- Dev Tools ---
      gcc
      cargo
      nodejs
      gnumake
      unzip
      ripgrep
      fd
      lua
      # jetbrains.rider
      # jetbrains.clion
      javaPackages.compiler.openjdk21
      python3
      glib

      # --- Formatters / LSP / Type checker ---
      stylua
      shfmt
      nixfmt
      nixd
      pyright
      black
      prettier
      tree-sitter

      # --- CLI Utils ---
      wget
      microfetch
      (btop.override { rocmSupport = true; })
      xclip
      csvlens
      bitwarden-cli
      tree
      grc
      bat

      # --- Desktop Apps ---
      whatsie
      libreoffice-qt-stable
      nautilus
      pinta
      # mendeley
      loupe
      krita

      # --- Networking ---
      # openfortivpn
      # openfortivpn-webview

      # --- Hyprland Core ---
      # hyprland
      hypridle
      hyprpicker
      hyprshot

      # --- System Utilities ---
      kdePackages.qtwayland
      kdePackages.qt6ct
      wl-clipboard
      libnotify
      pavucontrol
      networkmanagerapplet
      killall
      gparted
      gpu-screen-recorder

      # --- Fonts ---
      nerd-fonts.jetbrains-mono

      # --- Custom Scripts ---
      (import ../../scripts/quicknote.nix { inherit pkgs; })
      (import ../../scripts/toggle_monitor.nix { inherit pkgs; })
    ]
    ++ uniqueApps;
}
