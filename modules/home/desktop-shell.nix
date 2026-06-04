{
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default

  ];
  programs.kitty.extraConfig = "include $HOME/.config/kitty/themes/noctalia.conf";

  # Noctalia
  programs.noctalia = {
    enable = true;
  };

}
