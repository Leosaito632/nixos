{ pkgs, ... }:

let
  overlay = self: super: {
    vaapiIntel = super.intel-vaapi-driver.overrideAttrs (old: {
      passthru = old.passthru or { };
    });
  };
in
{
  nixpkgs.overlays = [ overlay ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
