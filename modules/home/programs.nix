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
    if hostName == "Desktop" then
      with pkgs;
      [
        osu-lazer
        spotify
        prismlauncher
        discord
      ]
    else
      with pkgs;
      [
      ];
in
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

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  # programs.vscode = {
  #   enable = true;
  #   profiles.default.extensions = with pkgs.vscode-extensions; [
  #     ms-python.python
  #     ms-toolsai.jupyter
  #   ];
  # };

  home.packages =
    with pkgs;
    [
      # Gera Gerall
      # --- Dev Tools ---
      gcc
      cargo
      nodejs
      zed-editor
      gnumake
      unzip
      ripgrep
      fd
      tree
      lua
      # jetbrains.rider
      # jetbrains.clion
      nil
      javaPackages.compiler.openjdk21
      python3
      black
      glib

      # --- Formatters ---
      stylua
      shfmt
      nixfmt

      # --- CLI Utils ---
      wget
      microfetch
      (btop.override { rocmSupport = true; })
      xclip
      csvlens
      bitwarden-cli
      git-crypt

      # --- Desktop Apps ---
      whatsie
      libreoffice-qt6-fresh
      nautilus
      pinta
      blender
      # mendeley
      loupe

      # --- Networking ---
      # openfortivpn
      # openfortivpn-webview

      # --- Hyprland Core ---
      hyprland
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
      power-profiles-daemon
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
