{ self, inputs, ... }:
{
  flake.homeModules.theme =
    { pkgs, ... }:
    {
      colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

      home.packages = with pkgs; [
        kora-icon-theme
        magnetic-catppuccin-gtk
      ];
      gtk = {
        enable = true;
        font = {
          name = "JetBrainsMono";
          size = 12;
        };
        theme = {
          name = "Catppuccin-GTK-Dark";
          package = pkgs.magnetic-catppuccin-gtk;
        };
        iconTheme = {
          name = "kora-pgrey";
          package = pkgs.kora-icon-theme;
        };
      };
    };
}
