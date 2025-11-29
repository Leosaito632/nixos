{
  vars,
  pkgs,
  inputs,
  ...
}:
{
  home.file."Pictures/Wallpapers".source = ../../Backgrounds;

  # Mouse pointer cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.bibata-cursors;

    name = vars.cursorTheme;
    size = vars.cursorSize;
  };

  gtk = {
    enable = true;
  };
}
