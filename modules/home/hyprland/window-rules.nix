{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Transparência e Opacidade
      "opacity 0.9 0.9, match:class foot"
      "opacity 1.0 override 1.0 override, match:class zen-twilight"

      # --- Quicknote ---
      "float on, match:class quicknote_float"
      "size 1200 750, match:class quicknote_float"
      "center on, match:class quicknote_float"
      "workspace special:quicknote, match:class quicknote_float"
      "opacity 0.85 override 0.85 override, match:class quicknote_float"
      #"workspace 1, match:workspace special:quicknote"

      # --- ZapZap ---
      "workspace 10 silent, match:class com.rtosta.zapzap"

      # --- Picture in Picture ---
      "float on, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"
    ];
  };
}
