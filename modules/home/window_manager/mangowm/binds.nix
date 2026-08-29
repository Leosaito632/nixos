{ vars, ... }:
let
  terminal = "${vars.terminal}";
  browser = "${vars.browser}";
  fileManager = "${vars.terminal} -e ${vars.file}";
in
{
  wayland.windowManager.mango.settings = {

    bind = [
      # reload config
      "SUPER, r, reload_config"

      # menu and terminal
      "SUPER, a, spawn, noctalia msg panel-toggle launcher"
      "SUPER, t, spawn, ${terminal}"

      # exit
      "SUPER, m, quit"
      "SUPER, q, killclient"

      # switch window focus"
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
      # "ALT + SHIFT, f, togglefakefullscreen, "
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
      "SUPER, n, switch_layout"

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
      "SUPER + Alt, Left, tagmon, left"
      "SUPER + Alt, Right, tagmon, right"

      # gaps
      "ALT + SHIFT, X, incgaps, 1"
      "ALT + SHIFT, Z, incgaps, -1"
      "ALT + SHIFT, R, togglegaps"

      # movewin
      "CTRL + SHIFT, Up, movewin, +0, -50"
      "CTRL + SHIFT, Down, movewin, +0, +50"
      "CTRL + SHIFT, Left, movewin, -50, +0"
      "CTRL + SHIFT, Right, movewin, +50, +0"

      # resizewin
      "CTRL + ALT, Up, resizewin, +0, -50"
      "CTRL + ALT, Down, resizewin, +0, +50"
      "CTRL + ALT, Left, resizewin, -50, +0"
      "CTRL + ALT, Right, resizewin, +50, +0"

      "SUPER + shift, n, spawn, ${terminal} -e quicknote"
      "SUPER, v, spawn, noctalia msg panel-toggle clipboard"
      "SUPER, space, switch_keyboard_layout"
      "SUPER, w, spawn, ${browser}"
      "SUPER, i, spawn, noctalia msg settings-toggle"
      "SUPER, BackSpace, spawn, noctalia msg panel-toggle session"
      "SUPER, l, spawn, noctalia msg session lock"
      "ctrl + shift, Escape, spawn, ${terminal} -e btop"
      "SUPER, p, spawn, hyprpicker -a"
      "SUPER, e, spawn, ${fileManager}"
    ];
  };
}
