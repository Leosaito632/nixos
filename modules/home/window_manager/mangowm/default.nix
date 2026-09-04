{ inputs, vars, ... }:
{
  imports = [
    inputs.mangowm.hmModules.mango
    ./binds.nix
    ./monitors.nix
  ];

  wayland.windowManager.mango = {
    enable = true;

    autostart_sh = ''
      noctalia &
      nm-applet &
      noctalia &
      wl-paste --type text --watch cliphist store &
      wl-paste --type image --watch cliphist store &
      whatsie &
      quicknote &
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
      shadowscolor = "0x000000ff";

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
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;
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
        opafadeout = "0.5,0.5,0.5,0.5";
        opafadein = "0.46,1.0,0.29,1";
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
      default_mfact = 0.55;
      default_nmaster = 1;
      tag_num = 9;
      smartgaps = 0;

      # Dwindle Layout Setting
      dwindle_smart_split = 0;
      dwindle_drop_simple_split = 1;
      dwindle_manual_split = 0;
      dwindle_hsplit = 1;
      dwindle_vsplit = 1;
      dwindle_preserve_split = 0;
      # Overview Setting
      hotarea_size = 10;
      enable_hotarea = 0;
      #ov_tab_mode = 1;
      overviewgappi = 5;
      overviewgappo = 30;

      # Misc
      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      focus_on_activate = 1;
      idleinhibit_ignore_visible = 0;
      sloppyfocus = 1;
      warpcursor = 1;
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
      numlockon = 1;
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
      gappih = 5;
      gappiv = 5;
      gappoh = 3;
      gappov = 3;
      scratchpad_width_ratio = 0.8;
      scratchpad_height_ratio = 0.9;
      borderpx = 4;
      rootcolor = "0x201b14ff";
      bordercolor = "0x444444ff";
      dropcolor = "0x8FBA7C55";
      splitcolor = "0xEB441EFF";
      focuscolor = "0xc9b890ff";
      maximizescreencolor = "0x89aa61ff";
      urgentcolor = "0xad401fff";
      scratchpadcolor = "0x516c93ff";
      globalcolor = "0xb153a7ff";
      overlaycolor = "0x14a57cff";

      # layout support:
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tagrule = [
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
      layerrule = [
        "animation_type_open:zoom,layer_name:rofi"
        "animation_type_close:zoom,layer_name:rofi"
      ];

      windowrule = "isnamedscratchpad:1, width: 1200, height:800, appid:quicknote_float";
    };
  };
}
