{
  flake.homeModules.zed = {
    programs.zed-editor = {
      enable = true;

      extensions = [
        "nix"
        "toml"
        "rust"
        "qml"
      ];
      userSettings = {
        theme = {
          mode = "dark";
          dark = "Catppuccin Mocha";
          light = "Catppuccin Mocha";
        };
        icon_theme = "Catppuccin Mocha";
        vim_mode = true;
        agent = {
          button = false;
        };
        collaboration_panel = {
          button = false;
        };
        notification_panel = {
          button = false;
        };
        outline_panel = {
          button = false;
        };
        git_panel = {
          button = false;
        };
        tabs = {
          file_icons = true;
        };
        tab_bar = {
          show = true;
        };
        scrollbar = {
          show = "never";
        };
        title_bar = {
          show_menus = false;
          show_sign_in = false;
          show_user_picture = false;
          show_onboarding_banner = false;
          show_project_items = false;
          show_branch_name = false;
          show_branch_icon = false;
        };
        debugger = {
          button = false;
        };
        search = {
          button = false;
        };
        diagnostics = {
          button = true;
        };
        terminal = {
          dock = "right";
          button = true;
        };
        status_bar = {
          cursor_position_button = false;
          active_language_button = true;
        };
        project_panel = {
          button = true;
        };
      };
    };

  };
}
