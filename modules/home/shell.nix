{ pkgs, hostName, ... }:
{
  home.shellAliases = {
    nshell = "nix-shell --command 'zsh'";
    hme = "nvim ~/.dotfiles/home.nix";
    nre = "nvim ~/.dotfiles/configuration.nix";
    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#${hostName}";
    vpn = "openfortivpn-webview vpn.pucpr.br:443 | sudo openfortivpn vpn.pucpr.br:443 -u leonardo.saito --realm=saml --cookie-on-stdin";
    cls = "clear";
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "foot";
    TERM = "foot";
    GTK_THEME = "Adwaita:dark";
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = "true";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
        "docker"
        "docker-compose"
      ];
    };
    initContent = ''
      if [ -f "''${HOME}/.p10k.zsh" ]; then source "''${HOME}/.p10k.zsh"; fi
    '';
  };

  home.file.".p10k.zsh".source = ../../p10k.zsh;
}
