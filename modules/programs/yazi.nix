{
  flake.homeModules.yazi = {
    programs.yazi = {
      enable = true;

      shellWrapperName = "y";
      settings = {
        mgr = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };
  };
}
