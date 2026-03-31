{
  flake.homeModules.git-cfg = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Syntix";
          email = "syntix@syntix.dev";
        };
      };
    };
  };
}
