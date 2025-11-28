{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
    };

    targets = {
      gtk.enable = false;
      foot.enable = false;
      yazi.enable = false;

      firefox.enable = false;
      zen-browser.enable = false;
      waybar.enable = false;
      hyprland.enable = false;
      rofi.enable = false;
      neovim.enable = false;
      dunst.enable = false;
    };
  };

  home.file."Pictures/Wallpapers".source = ../../sddm-theme/Backgrounds;
}
