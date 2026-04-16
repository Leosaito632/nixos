{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "image/png" = [ "pinta.desktop" ];
      "image/jpeg" = [ "pinta.desktop" ];
      "image/jpg" = [ "pinta.desktop" ];
      "image/webp" = [ "pinta.desktop" ];

      "image/gif" = [ "pinta.desktop" ];
      "image/bmp" = [ "pinta.desktop" ];
      "image/tiff" = [ "pinta.desktop" ];

      "image/svg+xml" = [ "pinta.desktop" ];

      "text/html" = [ "zen-twilight.desktop" ];
      "application/pdf" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/http" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/https" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/about" = [ "zen-twilight.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-twilight.desktop" ];
    };
  };
}
