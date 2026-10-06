{ pkgs, lib, ... }:
{
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
