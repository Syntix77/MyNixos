{ self, inputs, ... }:
{
  flake.homeModules.syntix = {
    imports = [
      inputs.noctalia.homeModules.default
      self.homeModules.git-cfg
      self.homeModules.hyprland-wm
      self.homeModules.noctalia

      self.homeModules.zed
    ];

    home.username = "syntix";
    home.homeDirectory = "/home/syntix";
    home.stateVersion = "25.11";
  };
}
