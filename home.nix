{inputs, config, pkgs, lib, hostName, ...}:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";

  home.shellAliases = {
    nshell = "nix-shell --command 'zsh'";
    hme = "nvim ~/.dotfiles/home.nix";
    nre = "nvim ~/.dotfiles/configuration.nix";
    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#${hostName}";
    vpn = "openfortivpn-webview vpn.pucpr.br:443 | sudo openfortivpn vpn.pucpr.br:443 -u leonardo.saito --realm=saml --cookie-on-stdin"; 
    plan = "io.github.alainm23.planify"; };

  # -------- HYPRLAND --------
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    # Desabilita a geração de config do Home Manager
    # para usar o arquivo hyprland.conf copiado do https://github.com/vasujain275/rudra.
    extraConfig = builtins.readFile ./config/hypr/hyprland.conf;
  };

  # Linkar os arquivos de configuração
  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."waybar".source = ./config/waybar;
  xdg.configFile."dunst".source = ./config/dunst;
  xdg.configFile."wlogout".source = ./config/wlogout;
	xdg.configFile."rofi".source = ./config/rofi;


	# -------- PROGRAMS --------
  # Enable neovim and set as default text editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Enable Alacritty
  programs.alacritty.enable = true;

  # Enable and config zsh
  programs.zsh = {
    enable=true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins =  
      [{
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }];  
    # Enable ohMyZsh
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "command-not-found" "docker-compose" "docker"];
    };
    initContent = ''
      if [ -f "''${HOME}/.p10k.zsh" ]; then
        source "''${HOME}/.p10k.zsh"
      fi
    '';
  };

  # Enable zen zen-browser
  programs.zen-browser.enable=true;

	# Install firefox.
  programs.firefox.enable = true;

  # foot
  programs.foot = {
    enable=true;
    settings = {
      main = {
        font = "MesloLGS NF:size=12";
      };
    };
  };

  # Installed Programs
  home.packages = with pkgs; [
      wget
      fastfetch
      btop
      git
      gh
      vscode
      wasistlos
      obsidian
      openfortivpn
      openfortivpn-webview
      libreoffice-qt6-fresh
      lua
      xclip
      pinta
      csvlens
      gcc
      pyright
      bruno
      nodejs
      tree
      discord
      dbeaver-bin
      black
      planify
      xfce.thunar
      xfce.tumbler
      yazi

		  # Dependências do hyprland do hyprland do https://github.com/vasujain275/rudra/
      # --- Core do Hyprland ---
      hyprland
      hyprlock    # Bloqueio de tela
      hypridle    # Inatividade/Suspensão
      hyprpicker  # Seletor de cores (Win+Shift+C)
      
      # --- Interface Gráfica ---
      waybar      # Barra superior
      dunst       # Notificações
      rofi-wayland # Menu de apps
      wlogout     # Menu de sair
      swww        # Wallpaper Engine
      
      # --- Utilitários de Sistema ---
      grim        # Screenshot
      slurp       # Selecionar área
      swappy      # Editor de screenshot
      wl-clipboard# Copiar/Colar
      cliphist    # Histórico de clipboard
      libnotify   # Para o comando 'notify-send'
      imagemagick # Processamento de imagens (usado nos scripts)
      pavucontrol # Controle de volume GUI
      playerctl   # Controle de mídia (Play/Pause)
      brightnessctl # Brilho da tela
      networkmanagerapplet # Ícone de rede na barra
      
      # --- Fontes e Ícones usados pelo Rudra ---
      bibata-cursors
      papirus-icon-theme
      nerd-fonts.jetbrains-mono # Fonte principal do terminal/editor
      font-awesome              # Ícones da Waybar
      montserrat                # Fonte da UI

      # --- Scripts do Rudra ---
      (import ./scripts/wallsetter.nix { inherit pkgs; })
      (import ./scripts/rofi-launcher.nix { inherit pkgs; })
      (import ./scripts/screenshootin.nix { inherit pkgs; })
      (import ./scripts/list-hypr-bindings.nix { inherit pkgs; })
  ];
 
  # Fonts
  fonts.fontconfig.enable = true;

  # powerlevel10k config file source 
  home.file.".p10k.zsh".source = ./p10k.zsh;
 
 # Session Variables
  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "foot";
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD="true";
    TERM = "foot";
  };
}
