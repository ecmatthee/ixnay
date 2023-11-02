{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprland-protocols
    #hyprland-share-picker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        ",preferred,auto,auto"
        "HDMI-A-1,disable"
        "HDMI-A-2,disable"
      ];
      exec-once = "hyprpaper & foot --server & waybar";

      env = "XCURSOR_SIZE,24";

      input = {
        kb_layout = "us";
        #kb_variant = "";
        #kb_model = "";
        #kb_options = "";
        #kb_rules = "";

        follow_mouse = 1;
        touchpad = {
            natural_scroll = false;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      
        layout = "dwindle";
      };

      misc = {
        enable_swallow = true;
        swallow_regex = "^(foot)$";
      };

      decoration = {
        rounding = 10;
      
        #blur = true;
        #blur_size = 3;
        #blur_passes = 1;
        #blur_new_optimizations = true;
      
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      
        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;
      };

      animations = {
        enabled = true;
      
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      
        animation = [
          "windows, 1, 7, myBezier"
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      
      dwindle = {
          pseudotile = true;
          preserve_split = false;
      };
      
      gestures = {
          workspace_swipe = false;
      };

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, return, exec, footclient"
        "$mainMod, T, exec, foot"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, M, exit,"
        #"$mainMod, E, exec, dolphin"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, rofi -show combi"
        "$mainMod, C, exec, rofi -show calc -modi calc -no-show-match -no-sort -no-persist-history -calc-command \"echo -n '{result}' | wl-copy\"" # ctrl+return = copy to clip
        "$mainMod, I, exec, rofi -modi emoji -show emoji"
        #"$mainMod, P, pseudo," # dwindle
        #"$mainMod, I, togglesplit" # dwindle
        "$mainMod, O, exec, hyprpicker -a -f hex"
        #"$mainMod, C, exec, hyprpicker -a -f hsl"
        #"$mainMod, C, exec, hyprpicker -a -f hsv"
        #"$mainMod, C, exec, hyprpicker -a -f cmyk"
        "$mainMod, F, fullscreen,"
        "$mainMod, X, exec, swaylock -f"
        # VIM Bindings
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        # Arrows
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # Switch Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Move Active Window
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindle = [
        # Volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        # Volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        "$mainMod, G, exec, hyprctl dispatch dpms on"
        "$mainMod SHIFT, G, exec, hyprctl dispatch dpms off"
      ];
    };
  };
}
