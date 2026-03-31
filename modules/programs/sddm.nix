{
  flake.nixosModules.sddm =
    { pkgs, ... }:
    let
      sddm-astronaut = pkgs.sddm-astronaut.override {
        themeConfig = {
          #AccentColor = "#746385";
          #FormPosition = "left";
          Background = "/etc/nixos/wallpaper/tree.png";
          ForceHideCompletePassword = true;
        };
      };

    in
    {
      services.displayManager.sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "kwin";
        };

        package = pkgs.kdePackages.sddm; # qt6 sddm version
        theme = "sddm-astronaut-theme";
        extraPackages = [ sddm-astronaut ];
      };

      environment.systemPackages = [ sddm-astronaut ];
    };
}
