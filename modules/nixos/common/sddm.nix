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
      # initial_session = {
      #   command = "mango";
      #   user = "leo"; # auto-login on first start, no password required
      # };
      default_session = {
        command = lib.getExe' pkgs.tuigreet "tuigreet --cmd mango";
        user = "greeter";
      };
    };
  };
}
