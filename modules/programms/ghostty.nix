{ self, inputs, ... }:
{
  flake.homeModules.ghostty =
    { config, ... }:
    {
      programs.ghostty = {
        enable = true;
        installVimSyntax = true;

        settings = {
          font-size = 12;
          font-family = "JetBrainsMono";
          theme = "Dynamic";
          gtk-single-instance = true;
          #gtk-gsk-renderer = "default";

          window-decoration = false;
          window-padding-x = 12;
          window-padding-y = 12;

          resize-overlay = "never";
          resize-overlay-position = "bottom-right";
          confirm-close-surface = false;

          background-opacity = 0.9;

          cursor-style = "bar";
        };

        themes = {
          Dynamic = {
            background = "#${config.colorScheme.palette.base00}";
            cursor-color = "#${config.colorScheme.palette.base05}";
            foreground = "#${config.colorScheme.palette.base05}";
            palette = [
              "0=#${config.colorScheme.palette.base03}"
              "1=#${config.colorScheme.palette.base08}"
              "2=#${config.colorScheme.palette.base0B}"
              "3=#${config.colorScheme.palette.base0A}"
              "4=#${config.colorScheme.palette.base0D}"
              "5=#${config.colorScheme.palette.base0E}"
              "6=#${config.colorScheme.palette.base0C}"
              "7=#${config.colorScheme.palette.base06}"
              "8=#${config.colorScheme.palette.base03}"
              "9=#${config.colorScheme.palette.base08}"
              "10=#${config.colorScheme.palette.base0B}"
              "11=#${config.colorScheme.palette.base0A}"
              "12=#${config.colorScheme.palette.base0D}"
              "13=#${config.colorScheme.palette.base0E}"
              "14=#${config.colorScheme.palette.base0C}"
              "15=#${config.colorScheme.palette.base06}"
            ];
            selection-background = "#${config.colorScheme.palette.base01}";
            selection-foreground = "#${config.colorScheme.palette.base05}";
          };
        };
      };
    };
}
