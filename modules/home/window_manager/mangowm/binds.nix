{ vars, ... }:
let
  terminal = "${vars.terminal}";
  browser = "${vars.browser}";
  fileManager = "${vars.terminal} -e ${vars.file}";
in
{
  wayland.windowManager.mango.settings = {

    bind = [
      # Core
      "SUPER, w, spawn, ${browser}"
      "SUPER, t, spawn, ${terminal}"
      "SUPER, e, spawn, ${fileManager}"
      "ctrl + shift, Escape, spawn, ${terminal} -e btop"
      "SUPER, space, switch_keyboard_layout"

      "SUPER, n, toggle_named_scratchpad, quicknote_float, none, ${terminal} --class=quicknote_float quicknote"
      "SUPER, m, spawn, toggle_monitor"

      # Hypr/Wayland
      "SUPER, p, spawn, hyprpicker -a"

      # Noctalia
      "SUPER, v, spawn, noctalia msg panel-toggle clipboard"
      "SUPER, i, spawn, noctalia msg settings-toggle"
      "SUPER, BackSpace, spawn, noctalia msg panel-toggle session"
      "SUPER, l, spawn, noctalia msg session lock"
      "SUPER, a, spawn, noctalia msg panel-toggle launcher"

      # Media Keys
      "none, XF86MonBrightnessUp, spawn, noctalia msg brightness-up"
      "none, XF86MonBrightnessDown, spawn, noctalia msg brightness-down"
      "none, XF86AudioRaiseVolume, spawn, noctalia msg volume-up"
      "none, XF86AudioLowerVolume, spawn, noctalia msg volume-down"
      "none, XF86AudioMute, spawn, noctalia msg volume-mute"
      "none, XF86AudioPlay, spawn, noctalia msg media toggle"
      "none, XF86AudioNext, spawn, noctalia msg media next"
      "none, XF86AudioPrev, spawn, noctalia msg media previous"
      "none, XF86AudioMicMute, spawn, noctalia msg mic-mute"

      # Mangowm IPC
      "SUPER, r, reload_config"

      # "SUPER, m, quit"
      "SUPER, q, killclient"

      "SUPER, Tab, focusstack, next"
      "ALT, Left, focusdir, left"
      "ALT, Right, focusdir, right"
      "ALT, Up, focusdir, up"
      "ALT, Down, focusdir, down"

      # swap window
      "SUPER + SHIFT, Up, exchange_client, up"
      "SUPER + SHIFT, Down, exchange_client, down"
      "SUPER + SHIFT, Left, exchange_client, left"
      "SUPER + SHIFT, Right, exchange_client, right"

      # switch window status
      "SUPER, g, toggleglobal, "
      "ALT, Tab, togglejump, "
      "SUPER + alt, space, togglefloating"
      "ALT, f, togglemaximizescreen, "
      "SUPER, f, togglefullscreen, "
      "SUPER, Down, minimized"
      "SUPER, o, toggleoverlay, "
      "SUPER, Up, restore_minimized"
      "SUPER, s, toggle_scratchpad"

      # scroller layout
      "ALT, e, set_proportion, 1.0"
      "ALT, x, switch_proportion_preset, "
      "alt + SUPER+ctrl, Left, scroller_stack, left"
      "alt + SUPER+ctrl, Right, scroller_stack, right"
      "alt + SUPER+ctrl, Up, scroller_stack, up"
      "alt + SUPER+ctrl, Down, scroller_stack, down"

      #dwindle layout(manual split mode)
      "alt + shift, Return, dwindle_toggle_split_direction"

      # switch layout
      "SUPER + ALT, n, switch_layout"

      # tag switch
      "SUPER, Left, viewtoleft, 0"
      "SUPER + CTRL, Left, viewtoleft_have_client, 0"
      "SUPER, Right, viewtoright, 0"
      "SUPER + CTRL, Right, viewtoright_have_client, 0"
      "ALT + SUPER, Left, tagtoleft, 0"
      "ALT + SUPER, Right, tagtoright, 0"

      "SUPER, 1, view, 1, 0"
      "SUPER, 2, view, 2, 0"
      "SUPER, 3, view, 3, 0"
      "SUPER, 4, view, 4, 0"
      "SUPER, 5, view, 5, 0"
      "SUPER, 6, view, 6, 0"
      "SUPER, 7, view, 7, 0"
      "SUPER, 8, view, 8, 0"
      "SUPER, 9, view, 9, 0"

      # tag: move client to the tag and focus it
      # tagsilent: move client to the tag and not focus it
      # "Alt, 1, tagsilent, 1
      "SUPER + Alt, 1, tag, 1, 0"
      "SUPER + Alt, 2, tag, 2, 0"
      "SUPER + Alt, 3, tag, 3, 0"
      "SUPER + Alt, 4, tag, 4, 0"
      "SUPER + Alt, 5, tag, 5, 0"
      "SUPER + Alt, 6, tag, 6, 0"
      "SUPER + Alt, 7, tag, 7, 0"
      "SUPER + Alt, 8, tag, 8, 0"
      "SUPER + Alt, 9, tag, 9, 0"

      # monitor switch
      "alt + shift, Left, focusmon, left"
      "alt + shift, Right, focusmon, right"

      # gaps
      #"ALT + SHIFT, X, incgaps, 1"
      #"ALT + SHIFT, Z, incgaps, -1"
      #"ALT + SHIFT, R, togglegaps"

      # movewin
      # "SUPER + SHIFT, Up, movewin, +0, -50"
      # "SUPER + SHIFT, Down, movewin, +0, +50"
      # "SUPER + SHIFT, Left, movewin, -50, +0"
      # "SUPER + SHIFT, Right, movewin, +50, +0"

      # resizewin
      "CTRL + ALT, Up, resizewin, +0, -50"
      "CTRL + ALT, Down, resizewin, +0, +50"
      "CTRL + ALT, Left, resizewin, -50, +0"
      "CTRL + ALT, Right, resizewin, +50, +0"

      # Screenshot
      "NONE, Print, spawn, noctalia msg screenshot-fullscreen"
      # Captura todas as telas
      "SUPER, Print, spawn, noctalia msg screenshot-fullscreen all"
      # Captura região
      "SUPER + SHIFT, S, spawn, noctalia msg screenshot-region"
    ];

    bindr = [ "SUPER, SUPER_L, spawn, noctalia msg panel-toggle control-center" ];

  };
}
