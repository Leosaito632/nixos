{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"

      # Transparência e Opacidade
      "opacity 0.90 override 0.90 override, class:^(foot)$"
      "opacity 1.0 override 1.0 override, class:^(firefox)$"
      "opacity 1.0 override 1.0 override, class:^(zen-twilight)$"
      "opacity 1.0 override 1.0 override, class:^(google-chrome)$"
      "opacity 1.0 override 1.0 override, class:^(vlc)$"
      "opacity 1.0 override 1.0 override, class:^(mpv)$"
      "opacity 1.0 override 1.0 override, class:^(imv)$"
      "opacity 1.0 override 1.0 override, class:^(eog)$"

      # --- Quicknote ---
      "float, class:^(quicknote_float)$"
      "size 45% 50%, class:^(quicknote_float)$"
      "center, class:^(quicknote_float)$"
      "workspace special:quicknote, class:^(quicknote_float)$"
      "noborder, class:^(quicknote_float)$"
      "opacity 0.85 override 0.85 override, class:^(quicknote_float)$"
      "workspace 1, unset, onworkspace:special:quicknote"

      # --- ZapZap ---
      "workspace 10 silent, class:^(ZapZap)$"

      # --- Picture in Picture ---
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
    ];
  };
}
