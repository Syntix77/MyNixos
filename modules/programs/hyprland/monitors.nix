{
  flake.homeModules.hyprland-wm = {
    wayland.windowManager.hyprland.settings = {
      input = {
        kb_layout = "de";
      };
      #Turn of Screen when closing Laptop
      bindl = [
        '', switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"''
        '', switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"''
      ];

      monitor = [
        #Laptop
        "eDP-1, 1920x1080, auto, 1" # Notebook

        #Dock
        "DP-7, 3840x2160, auto, 1.25" # Dock Left
        "DP-8, 3840x2160, auto, 1.25" # Dock Right
        "*, preffered, auto, 1" # Auto Unknown
      ];
    };
  };
}
