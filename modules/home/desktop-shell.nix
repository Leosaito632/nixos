{
  config,
  inputs,
  ...
}:
{
  #imports = [
  #  inputs.illogical-flake.homeManagerModules.default
  #];
  # Noctalia
  xdg.configFile."noctalia".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/config/noctalia"; # mkOutOfStoreSymlink para a UI poder alterar o arquivo

  # end4dots illogical impulse
  #programs.illogical-impulse = {
  #  enable = true;

  #  # Customize shell tools (all enabled by default)
  #  dotfiles = {
  #    fish.enable = true; # Fish shell with custom config
  #    kitty.enable = true; # Kitty terminal emulator
  #    starship.enable = true; # Starship prompt
  #  };

  #  # Hyprland Plugins (Declarative installation & loading)
  #  #    hyprland.plugins = [
  #  #      pkgs.hyprlandPlugins.hyprbars
  #  #      pkgs.hyprlandPlugins.hyprexpo
  #  #      # Add any other plugins available in nixpkgs
  #  #    ];
  #};
}
