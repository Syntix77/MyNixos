{
  flake.homeModules.hyprland-wm = {
    wayland.windowManager.hyprland.extraConfig = ''
      	  layerrule {
        	    name = noctalia
        	    match:namespace = noctalia-background-.*$
        	    ignore_alpha = 0.5
        	    blur = true
        	    blur_popups = true
      	  }
        	'';
  };
}
