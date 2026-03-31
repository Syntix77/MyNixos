{
  flake.homeModules.hyprland-wm = {
    programs.hyprlock = {
      enable = true;
      settings = {
        background = [
          {
            monitor = "";
            path = "/etc/nixos/wallpaper/tree.png";
            blur_passes = 2;
            contrast = 0.8916;
            brightness = 0.8172;
            vibrancy = 0.1696;
            vibrancy_darkness = 0.0;
          }
        ];

        general = {
          ignore_empty_input = true;
          hide_cursor = true;
        };

        animations = {
          enabled = true;
          fade_in = {
            duration = 300;
            bezier = "easeOutQuint";
          };
          fade_out = {
            duration = 300;
            bezier = "easeOutQuint";
          };
        };

        input-field = [
          {
            monitor = "";
            size = "250, 55";
            outline_thickness = 2;
            dots_size = 0.2; # Scale of input-field height (0.2 - 0.8)
            dots_spacing = 0.2; # Scale of dots' absolute size (0.0 - 1.0)
            dots_center = true;
            outer_color = "rgba(0, 0, 0, 0)";
            inner_color = "rgba(100, 114, 125, 0.4)";
            font_color = "rgb(200, 200, 200)";
            fade_on_empty = false;
            font_family = "JetBrains Mono Nerd";
            placeholder_text = "<span foreground='##ffffff99'>Enter Pass</span>";
            hide_input = false;
            position = "0, -153";
            halign = "center";
            valign = "center";
          }
        ];

        label = [
          {
            monitor = "";
            text = "$TIME";
            color = "rgba(216, 222, 233, 0.70)";
            font_size = 140;
            font_family = "JetBrains Mono Nerd";
            position = "0, 260";
            halign = "center";
            valign = "center";
          }
          # Date (day and month)
          {
            monitor = "";
            text = "cmd[update:1000] date +\"%d.%m.%y\"";
            color = "rgba(216, 222, 233, 0.70)";
            font_size = 30;
            font_family = "JetBrains Mono Nerd";
            position = "0, 150";
            halign = "center";
            valign = "center";
          }
          # Lock Icon
          {
            monitor = "";
            text = "<span> </span>";
            color = "rgba(216, 222, 233, 0.70)";
            font_size = 24;
            font_family = "JetBrains Mono Nerd";
            position = "2, -110";
            halign = "center";
            valign = "top";
          }
          # Username greeting
          {
            monitor = "";
            text = "hi, $USER";
            color = "rgba(216, 222, 233, 0.70)";
            font_size = 20;
            font_family = "JetBrains Mono Nerd";
            position = "0, -100";
            halign = "center";
            valign = "center";
          }
        ];
        # Profile photo
        #image = {
        #    monitor = "";
        #    path = "$HOME/Pictures/user.jpg";
        #    border_color = "rgba(216, 222, 233, 0.70)";
        #    border_size = 3;
        #    size = 160;
        #    rounding = -1;        # -1 = circle
        #    rotate = 0;
        #    reload_time = -1;
        #    reload_cmd = "";
        #    position = "0, 15";
        #    halign = "center";
        #    valign = "center";
        #}

      };
    };
  };
}
