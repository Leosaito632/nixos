{ inputs, vars, ... }:
{
  imports = [
    inputs.mangowm.hmModules.mango
    ./binds.nix
    ./monitors.nix
  ];

  wayland.windowManager.mango = {
    enable = true;

    #    autostart_sh = ''
    #      noctalia &
    #      nm-applet &
    #      wl-paste --type text --watch cliphist store &
    #      wl-paste --type image --watch cliphist store &
    #    '';

    extraConfig = ''
      exec_once = noctalia
      exec_once = nm-applet
      exec_once = wl-paste --type text --watch cliphist store
      exec_once = wl-paste --type image --watch cliphist store
    '';

    settings = {

      # Window effect
      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params = {
        num_passes = 2;
        radius = 5;
        noise = 0.02;
        brightness = 0.9;
        contrast = 0.9;
        saturation = 1.2;
      };

      # Shadows
      shadows = 0;
      layer_shadows = 0;
      shadow_only_floating = 1;
      shadows_size = 10;
      shadows_blur = 15;
      shadows_position_x = 0;
      shadows_position_y = 0;
      shadows_color = "0x000000ff";

      # Mouse
      # need relogin to make it apply
      mouse_natural_scrolling = 0;
      mouse_accel_profile = 0;

      # Border
      border_radius = 6;
      no_radius_when_single = 0;

      # Focus Opacity
      focused_opacity = 1.0;
      unfocused_opacity = 0.8;
      # Animation Configuration(support type:zoom,slide)
      # tag_animation_direction: 1-horizontal,0-vertical
      animations = 1;
      layer_animations = 1;
      animation_type_open = "slide";
      animation_type_close = "zoom";
      animation_fade_in = 1;
      animation_fade_out = 1;
      tag_animation_direction = 1;
      zoom_initial_ratio = 0.4;
      zoom_end_ratio = 0.8;
      fade_in_begin_opacity = 0.5;
      fade_out_begin_opacity = 0.8;
      animation_duration_move = 500;
      animation_duration_open = 400;
      animation_duration_tag = 350;
      animation_duration_close = 800;
      animation_duration_focus = 0;

      animation_curve = {
        open = "0.46,1.0,0.29,1";
        move = "0.46,1.0,0.29,1";
        tag = "0.46,1.0,0.29,1";
        close = "0.08,0.92,0,1";
        focus = "0.46,1.0,0.29,1";
        opacity_fade_out = "0.5,0.5,0.5,0.5";
        opacity_fade_in = "0.46,1.0,0.29,1";
      };

      # Scroller Layout Setting
      scroller_structs = 20;
      scroller_default_proportion = 0.8;
      scroller_focus_center = 0;
      scroller_prefer_center = 0;
      edge_scroller_pointer_focus = 1;
      edge_scroller_focus_allow_speed = 0.0;
      scroller_default_proportion_single = 1.0;
      scroller_proportion_preset = "0.5,0.8,1.0";

      # Master-Stack Layout Setting
      new_is_master = 1;
      default_master_factor = 0.55;
      default_master_count = 1;
      tag_num = 9;
      smart_gaps = 0;

      # Dwindle Layout Setting
      dwindle_smart_split = 0;
      dwindle_drop_simple_split = 1;
      dwindle_manual_split = 0;
      dwindle_horizontal_split = 1;
      dwindle_vertical_split = 1;
      dwindle_preserve_split = 0;
      # Overview Setting
      hotarea_size = 10;
      enable_hotarea = 0;
      #ov_tab_mode = 1;
      overview_gap_inner = 5;
      overview_gap_outer = 30;

      # Misc
      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      focus_on_activate = 1;
      idle_inhibit_ignore_visible = 0;
      sloppy_focus = 1;
      warp_cursor = 1;
      focus_cross_monitor = 0;
      focus_cross_tag = 0;
      enable_floating_snap = 0;
      snap_distance = 30;
      cursor_size = 24;
      drag_tile_to_tile = 1;
      drag_tile_small = 1;

      # keyboard
      repeat_rate = 25;
      repeat_delay = 600;
      numlock_on = 1;
      xkb_rules_layout = "br,us";

      # Trackpad
      # need relogin to make it apply
      disable_trackpad = 0;
      tap_to_click = 1;
      tap_and_drag = 1;
      drag_lock = 1;
      trackpad_natural_scrolling = 1;
      swipe_min_threshold = 1;

      # Appearance
      gap_inner_horizontal = 5;
      gap_inner_vertical = 5;
      gap_outer_horizontal = 3;
      gap_outer_vertical = 3;
      scratchpad_width_ratio = 0.8;
      scratchpad_height_ratio = 0.9;
      border_px = 4;
      root_color = "0x201b14ff";
      border_color = "0x444444ff";
      drop_color = "0x8FBA7C55";
      split_color = "0xEB441EFF";
      focus_color = "0xc9b890ff";
      maximized_screen_color = "0x89aa61ff";
      urgent_color = "0xad401fff";
      scratchpad_color = "0x516c93ff";
      global_color = "0xb153a7ff";
      overlay_color = "0x14a57cff";

      # layout support:
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tag_rule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];

      # Key Bindings
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none

      # Mouse Button Bindings
      # btn_left and btn_right can't bind none mod key
      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];

      # Axis Bindings
      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
      ];

      # layer rule
      layer_rule = [
        "animation_type_open:zoom,layer_name:rofi"
        "animation_type_close:zoom,layer_name:rofi"
      ];

      window_rule = "is_named_scratchpad:1, width: 1200, height:800, app_id:quicknote_float";
    };
  };
}
