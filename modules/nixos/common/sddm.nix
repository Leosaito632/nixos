{ pkgs, lib, ... }:
{
  environment.systemPackages = [
    (pkgs.sddm-astronaut.override { embeddedTheme = "pixel_sakura_static"; })
  ];

  #   services.displayManager.sddm = {
  #     enable = true;
  #     #wayland.enable = true;
  #     autoNumlock = true;
  #
  #     theme = "sddm-astronaut-theme";
  #
  #     # Não sei por que mas precisa estar aqui.
  #     # No environment.systemPackages não funciona.
  #     extraPackages = [
  #       pkgs.kdePackages.qtmultimedia
  #     ];
  #   };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = lib.getExe' pkgs.tuigreet "tuigreet --cmd mango --remember --time";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
