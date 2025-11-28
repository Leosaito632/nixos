{ config, ... }:
{
  # Apenas o Noctalia :D
  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/noctalia";
}
