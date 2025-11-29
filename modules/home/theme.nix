{ pkgs, inputs, ... }:
{
  home.file."Pictures/Wallpapers".source = ../../Backgrounds;

  # Mouse pointer cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
  };
}
