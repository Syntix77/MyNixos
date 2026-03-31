{ self, inputs, ... }:
{
  flake.homeModules.syntix = {
    imports = [
      inputs.noctalia.homeModules.default
      inputs.agenix.homeManagerModules.default
      inputs.nix-colors.homeManagerModules.default

      self.homeModules.hyprland-wm
      self.homeModules.noctalia
      self.homeModules.theme

      self.homeModules.git-cfg
      self.homeModules.zed
      self.homeModules.ghostty
      self.homeModules.fish
      self.homeModules.starship

      self.homeModules.yazi
    ];

    home.username = "syntix";
    home.homeDirectory = "/home/syntix";
    home.stateVersion = "25.11";
  };
}
