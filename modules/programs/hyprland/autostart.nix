{
  flake.homeModules.hyprland-wm = {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "noctalia-shell"
      ];
    };
  };
}
