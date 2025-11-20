{inputs, config, pkgs, lib, hostName, ...}:
# let
#   hypr = inputs.hyprland.packages.${pkgs.system};
# in
{
  # imports = [
  #   inputs.illogical-impulse.homeManagerModules.default
  #   inputs.zen-browser.homeModules.twilight
  # ];


  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";

  # xBLACKICEx end-4-dots Hyprland config 
  # illogical-impulse = {
  #   # Enable the dotfiles suite
  #   enable = true;

  #   hyprland = {
  #     # Use customized Hyprland build
  #     # package = pkgs.hyprland;
  #     package = hypr.hyprland;

  #     # xdgPortalPackage = pkgs.xdg-desktop-portal-hyprland;
  #     xdgPortalPackage = hypr.xdg-desktop-portal-hyprland;

  #     # Enable Wayland ozone
  #     ozoneWayland.enable = true;
  #   };
  # };

  home.shellAliases = {
    nshell = "nix-shell --command 'zsh'";
    hme = "nvim ~/.dotfiles/home.nix";
    nre = "nvim ~/.dotfiles/configuration.nix";
    nrs = "nixos-rebuild switch --flake ~/.dotfiles#${hostName}";
    vpn = "openfortivpn-webview vpn.pucpr.br:443 | sudo openfortivpn vpn.pucpr.br:443 -u leonardo.saito --realm=saml --cookie-on-stdin"; 
    plan = "io.github.alainm23.planify"; };

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
  # programs.zen-browser.enable=true;

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


#   wayland.windowManager.hyprland.extraConfig = ''
#     # ===============================================
#     # == Minha Configuração Pessoal de Teclado
#     # ===============================================
#     input {
#         kb_layout = us,br
#         kb_variant = ,abnt2
#         kb_options = grp:win_space_toggle
#         kb_model =
#         kb_rules =
#     }
#   '';

}
