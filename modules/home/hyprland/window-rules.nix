{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Transparência e Opacidade
      "opacity 0.9 0.9, match:class kitty"
      "opacity 1.0 override 1.0 override, match:class zen-twilight"

      # --- Nautilus ---
      "float on, match:class org.gnome.Nautilus"
      "center on, match:class org.gnome.Nautilus"

      # --- Quicknote ---
      "float off, match:class quicknote_float"
      "center on, match:class quicknote_float"
      "workspace special:quicknote, match:class quicknote_float"
      "opacity 0.85 override 0.85 override, match:class quicknote_float"
      "workspace 1, match:workspace special:quicknote" # Only quicknote in quicknote workspace

      # --- whatsie ---
      "workspace 10 silent, match:class com.ktechpit.whatsie"

      # --- Picture in Picture ---
      "float on, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"

      # --- Noctalia ---
      "float on, match:class dev.noctalia.Noctalia.Settings"
      "center on, match:class dev.noctalia.Noctalia.Settings"

    ];
  };
}
