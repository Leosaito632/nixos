{ pkgs, ... }:

let
  sddmAstronautCustom = pkgs.callPackage ./themes/sddm-astronaut-custom.nix { };
in

{
  environment.systemPackages = [
    sddmAstronautCustom
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    package = pkgs.kdePackages.sddm;

    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];

    theme = "${sddmAstronautCustom}/share/sddm/themes/sddm-astronaut-theme";
  };
}
