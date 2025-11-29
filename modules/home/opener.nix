{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = "pinta.desktop";
      "image/jpeg" = "pinta.desktop";
      "image/webp" = "pinta.desktop";
    };
  };
}
