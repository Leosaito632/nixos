{
  lib,
  pkgs,
  hostName,
  config,
  ...
}:
{
  home.shellAliases = {
    nshell = "nix-shell --command 'zsh'";
    hme = "nvim ~/.dotfiles/home.nix";
    nre = "nvim ~/.dotfiles/";
    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#${hostName}";
    # vpn = "openfortivpn-webview vpn.pucpr.br:443 | sudo openfortivpn vpn.pucpr.br:443 -u leonardo.saito --realm=saml --cookie-on-stdin";
    cls = "clear";
    # run-rider = "nohup rider > /dev/null 2>&1 &"; # Roda rider em background
    zen-browser = "zen-twilight";
  };

  # Terminal
  #programs.foot = {
  #  enable = true;
  #  settings.main = {
  #    font = lib.mkForce "JetBrainsMono NF:size=12";
  #  };
  #};
  #xdg.configFile."foot/foot.ini".force = true;

  #  programs.alacritty = {
  #    enable = true;
  #settings = {
  #  font.normal = {
  #    family = "JetBrainsMono Nerd Font";
  #    style = "Regular";
  #  };
  #};
  #   };

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    extraConfig = "include $HOME/.config/kitty/themes/noctalia.conf";
  };

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
        "docker"
        "docker-compose"
      ];
    };
  };

  # Tema do shell
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
    };
  };
}
