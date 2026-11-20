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
        spotify
        discord
      ]
    else
      with pkgs;
      [
        power-profiles-daemon
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

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages =
    with pkgs;
    [
      # Geral
      # --- Dev Tools ---
      gcc
      cargo
      nodejs
      gnumake
      unzip
      ripgrep
      fd
      lua
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
      wlr-randr
      wl-mirror
      zenity # zapfast needs

      # --- Desktop Apps ---
      zapfast
      libreoffice-qt-stable
      nautilus
      loupe
      krita
      qdirstat

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
