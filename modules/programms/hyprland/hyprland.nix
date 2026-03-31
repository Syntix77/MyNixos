{
  flake.nixosModules.hyprland-wm =
    { inputs, pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
    };

  flake.homeModules.hyprland-wm = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
    };
  };
}
