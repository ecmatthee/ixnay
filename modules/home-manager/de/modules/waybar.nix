{
  programs = {
    waybar = {
      enable = true;
      systemd = {
        enable = true;
        target = "sway-session.target";
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          #height = 14;
          modules-left = [
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [
            "sway/window"
          ];
          modules-right = [
            "tray"
            "idle_inhibitor"
            "clock"
          ];

          #"hyprland/workspaces" = {
    	  #  #format = "{icon}";
          #  on-scroll-up = "hyprctl dispatch workspace e+1";
          #  on-scroll-down  = "hyprctl dispatch workspace e-1";
          #};

          #"hyprland/window" = {
          #  format = "{}";
          #  rewrite = {
          #      "(.*) — Mozilla Firefox" = "🌎 $1";
          #      "(.*) - fish" = "> [$1]";
          #  };
          #  separate-outputs = true;
          #};

          tray = {
            icon-size = 15;
          };

          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
             };
          };

          clock = {
            format = "{:%H:%M}  ";
            format-alt = "{:%A, %B %d, %Y (%R)}  ";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
              on-click-right = "mode";
              format = {
                months = "<span color='#ffead3'><b>{}</b></span>";
                days = "<span color='#ecc6d9'><b>{}</b></span>";
                weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            actions = {
              on-click-right = "mode";
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };

          "custom/recorder" = {
            format = " Rec";
            format-disabled = " Off-air";
            return-type = "json";
            interval = 1;
            exec = "echo '{\"class\": \"recording\"}'";
            exec-if = "pgrep wf-recorder";
          };

          "custom/audiorec" = {
              format = "♬ Rec";
              format-disabled = "♬ Off-air";
              return-type = "json";
              interval = 1;
              exec = "echo '{\"class\": \"audio recording\"}'";
              exec-if = "pgrep ffmpeg";
          };

          "custom/power" = {
              format = "⏻";
              on-click = "exec rofi -show power-menu -modi power-menu:rofi-power-menu";
              tooltip = false;
          };
        };
      };
    };
  };
}
