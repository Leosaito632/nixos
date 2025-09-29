{ config, pkgs, ...}:

{
  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "25.05";
  
  # Session Variables
  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "alacritty";
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
    # Enable ohMyZsh
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "command-not-found" ];
      theme = "agnoster";
    };
  };
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
  ];
}
