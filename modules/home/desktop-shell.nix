{
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.kitty.extraConfig = ''
    include $HOME/.config/kitty/themes/noctalia.conf
    editor nvim
  '';

  # Noctalia
  programs.noctalia = {
    enable = true;
  };
}
