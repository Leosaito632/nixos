{ config, ... }:
{
  # Noctalia
  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/noctalia"; # mkOutOfStoreSymlink para a UI poder alterar o arquivo

}
