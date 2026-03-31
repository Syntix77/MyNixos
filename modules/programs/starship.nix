{
  flake.homeModules.starship =
    {
      config,
      lib,
      ...
    }:
    {
      programs.starship = {
        enable = true;
        enableFishIntegration = true;
        settings = {
          format = lib.concatStrings [
            "[](surface0)"
            "$os"
            "$username"
            "[](bg:surface1 fg:surface0)"
            "$directory"
            "[](bg:surface2 fg:surface1)"
            "$git_branch"
            "$git_status"
            "[](bg:surface1 fg:surface2)"
            "$c"
            "$rust"
            "$nodejs"
            "$php"
            "$nix_shell"
            "$java"
            "$python"
            "$docker_context"
            "[](bg:surface0 fg:surface1)"
            "$time"
            "[ ](fg:surface0)"
            "$cmd_duration"
            "$line_break"
            "$character"
          ];

          palette = "nix-colors";

          os = {
            disabled = false;
            style = "bg:surface0 fg:blue";
          };
          os.symbols = {
            Ubuntu = "󰕈";
            SUSE = "";
            Raspbian = "󰐿";
            Mint = "󰣭";
            Linux = "󰌽";
            Gentoo = "󰣨";
            Fedora = "󰣛";
            Arch = "󰣇";
            CentOS = "";
            Debian = "󰣚";
            NixOS = "";
          };
          username = {
            show_always = true;
            style_user = "bg:surface0 fg:blue";
            style_root = "bg:surface0 fg:blue";
            format = "[ $user]($style)";
          };
          directory = {
            style = "bg:surface1 fg:mauve";
            format = "[ $path ]($style)";
            truncation_length = 3;
            truncation_symbol = "…/";
          };
          directory.substitutions = {
            Documents = "󰈙 ";
            Downloads = " ";
            Music = "󰝚 ";
            Pictures = " ";
            Developer = "󰲋 ";
          };
          git_branch = {
            symbol = "";
            style = "bg:surface2";
            format = "[[ $symbol $branch ](fg:red bg:surface2)]($style)";
          };
          git_status = {
            style = "bg:surface2";
            format = "[[($all_status$ahead_behind )](fg:red bg:surface2)]($style)";
          };
          nodejs = {
            symbol = "";
            style = "bg:surface1";
            format = "[[ $symbol( $version) ](fg:green bg:surface1)]($style)";
          };
          c = {
            symbol = " ";
            style = "bg:surface1";
            format = "[[ $symbol( $version) ](fg:green bg:surface1)]($style)";
          };
          rust = {
            symbol = "";
            style = "bg:surface3";
            format = "[[ $symbol( $version) ](fg:green bg:surface3)]($style)";
          };
          php = {
            symbol = "";
            style = "bg:surface1";
            format = "[[ $symbol( $version) ](fg:green bg:surface1)]($style)";
          };
          java = {
            symbol = " ";
            style = "bg:surface1";
            format = "[[ $symbol( $version) ](fg:green bg:surface1)]($style)";
          };
          python = {
            symbol = "";
            style = "bg:surface1";
            format = "[[ $symbol( $version)(\(#$virtualenv\)) ](fg:green bg:surface1)]($style)";
          };
          nix_shell = {
            symbol = "";
            style = "bg:surface1";
            format = "[[ $symbol( $version) ](fg:green bg:surface1)]($style)";
          };
          docker_context = {
            symbol = "";
            style = "bg:surface1";
            format = "[[ $symbol( $context) ](fg:green bg:surface1)]($style)";
          };
          time = {
            disabled = false;
            time_format = "%R";
            style = "bg:surface0";
            format = "[[  $time ](fg:flamingo bg:surface0)]($style)";
          };
          line_break = {
            disabled = true;
          };
          character = {
            disabled = false;
            success_symbol = "[❯](bold fg:green)";
            error_symbol = "[❯](bold fg:red)";
            vimcmd_symbol = "[❮](bold fg:green)";
            vimcmd_replace_one_symbol = "[❮](bold fg:lavender)";
            vimcmd_replace_symbol = "[❮](bold fg:lavender)";
            vimcmd_visual_symbol = "[❮](bold fg:yellow)";
          };
          cmd_duration = {
            show_milliseconds = true;
            format = " in $duration ";
            style = "bg:lavender";
            disabled = false;
            show_notifications = true;
            min_time_to_notify = 45000;
          };
          scan_timeout = 120;
          palettes.nix-colors = {
            base = "#${config.colorScheme.palette.base00}";
            mantle = "#${config.colorScheme.palette.base01}";
            surface0 = "#${config.colorScheme.palette.base02}";
            surface1 = "#${config.colorScheme.palette.base03}";
            surface2 = "#${config.colorScheme.palette.base04}";
            text = "#${config.colorScheme.palette.base05}";
            rosewater = "#${config.colorScheme.palette.base06}";
            lavender = "#${config.colorScheme.palette.base07}";
            red = "#${config.colorScheme.palette.base08}";
            peach = "#${config.colorScheme.palette.base09}";
            yellow = "#${config.colorScheme.palette.base0A}";
            green = "#${config.colorScheme.palette.base0B}";
            teal = "#${config.colorScheme.palette.base0C}";
            blue = "#${config.colorScheme.palette.base0D}";
            mauve = "#${config.colorScheme.palette.base0E}";
            flamingo = "#${config.colorScheme.palette.base0F}";
          };
        };
      };
    };
}
