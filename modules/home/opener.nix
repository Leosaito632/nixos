{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = [ "pinta.desktop" ];
      "image/jpeg" = [ "pinta.desktop" ];
      "image/jpg" = [ "pinta.desktop" ];
      "image/webp" = [ "pinta.desktop" ];

      "image/gif" = [ "pinta.desktop" ];
      "image/bmp" = [ "pinta.desktop" ];
      "image/tiff" = [ "pinta.desktop" ];

      "image/svg+xml" = [ "pinta.desktop" ];
    };
  };
}
