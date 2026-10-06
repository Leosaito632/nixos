{
  lib,
  pkgs,
  hostName,
  config,
  ...
}:
{
  home.shellAliases = {
    nshell = "nix-shell --command 'fish'";
    hme = "nvim ~/.dotfiles/home.nix";
    nre = "nvim ~/.dotfiles/";
    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#${hostName}";
    # vpn = "openfortivpn-webview vpn.pucpr.br:443 | sudo openfortivpn vpn.pucpr.br:443 -u leonardo.saito --realm=saml --cookie-on-stdin";
    cls = "clear";
    run-rider = "nohup rider > /dev/null 2>&1 &"; # Roda rider em background
    # run-clion = "nohup clion > /dev/null 2>&1 &"; # Roda clion em background
    zen-browser = "zen-twilight";
  };

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };

  # Shell
  programs.fish = {

    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      fish_config theme choose ayu
    '';
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
    ];
  };

  # Tema do shell
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    useTheme = "gruvbox";
  };
}
