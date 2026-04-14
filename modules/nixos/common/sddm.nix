{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.sddm-astronaut.override { embeddedTheme = "purple_leaves"; })
  ];

  services.displayManager.sddm = {
    enable = true;
    #wayland.enable = true;
    autoNumlock = true;

    theme = "sddm-astronaut-theme";

    # Não sei por que mas precisa estar aqui.
    # No environment.systemPackages não funciona.
    extraPackages = [
      pkgs.kdePackages.qtmultimedia
    ];
  };
}
