{
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default

  ];
  # Noctalia
  programs.noctalia-shell.enable = true;
  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/noctalia"; # mkOutOfStoreSymlink para a UI poder alterar o arquivo
  programs.kitty.extraConfig = "include $HOME/.config/kitty/themes/noctalia.conf";

}
