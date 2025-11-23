{ pkgs, ... }:

let
  overlay = self: super: {
    vaapiIntel = super.vaapiIntel.overrideAttrs (old: {
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
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
