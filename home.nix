{ config, pkgs, ...}:

{
  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";
  
  programs.home-manager.enable = true;

  # Session Variables
  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD="true";
  };
  	
  home.shellAliases = {
    nix-shell = "nix-shell --command 'zsh'";
    hme = "sudo nvim /etc/nixos/home.nix";
    nre = "sudo nvim /etc/nixos/configuration.nix";
    nrs = "sudo nixos-rebuild switch";
    updateNix = "sudo nixos-rebuild switch --upgrade";
    erm="echo 'Deu boa!!'";
  };
  # Enable neovim and set as default text editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Enable Alacritty
  programs.alacritty.enable = true;

  # Enable zsh
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
      plugins = [ "git" "command-not-found"];
    };

    initContent = ''
    # Source da configuração personalizada do Powerlevel10k
    [[ -f ~/.config/zsh/p10k.zsh ]] && source ~/.config/zsh/p10k.zsh
  '';
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
      mysql-workbench
      discord
      zsh-powerlevel10k
      meslo-lgs-nf
      nerd-fonts.meslo-lg
  ];
  fonts.fontconfig.enable = true;
  
  # Hyprland from https://github.com/xBLACKICEx/end-4-dots-hyprland-nixos/blob/main/README.md
#   illogical-impulse = {
#     enable = true;
# 
#     hyprland = {
#       package = inputs.illogical-impulse.legacyPackages.${pkgs.system}.hyprland;
#       xdgPortalPackage = inputs.illogical-impulse.legacyPackages.${pkgs.system}.xdg-desktop-portal-hyprland;
#       ozoneWayland.enable = true;
#     };
# 
#     dotfiles = {
#       fish.enable = true;
#       kitty.enable = true;
#     };
#   };
}
