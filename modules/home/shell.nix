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

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
  };

  # Shell
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
      ];
    };
  };

  # Tema do shell
  #  programs.starship = {
  #    enable = true;
  #    enableZshIntegration = true;
  #    settings = (
  #      builtins.fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/pure-preset.toml")
  #    );
  #  };
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "gruvbox";
  };
}
