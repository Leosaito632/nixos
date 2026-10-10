{ inputs, config }:
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ]; # Browsers
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
  programs.zen-browser.enable = true;
  programs.chromium.enable = true;

}
