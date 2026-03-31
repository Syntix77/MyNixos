{
  flake.homeModules.hyprland-wm = {
    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 4;
        gaps_out = 8;

        border_size = 1;
      };

      decoration = {
        rounding = 8;
        rounding_power = 2;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          vibrancy = 0.1696;
        };
      };
    };
  };
}
