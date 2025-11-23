{ pkgs, ... }:
let
  sddmTheme = pkgs.stdenv.mkDerivation {
    name = "rudra-sddm-theme";
    src = ../../sddm-theme;
    installPhase = ''
      mkdir -p $out/share/sddm/themes/rudra
      cp -r * $out/share/sddm/themes/rudra
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
    sddmTheme
  ];

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    theme = "rudra";
    autoNumlock = true;
  };
}
