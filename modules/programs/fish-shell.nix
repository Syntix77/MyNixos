{
  flake.homeModules.fish =
    { pkgs, ... }:
    {
      programs.fish = {
        enable = true;
        generateCompletions = true;
        interactiveShellInit = ''
          set -g fish_greeting
          pokemon-colorscripts -r --no-title
        '';
      };

      home.packages = with pkgs; [
        pokemon-colorscripts
      ];
    };

  flake.nixosModules.fish =
    { pkgs, ... }:
    {
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;
    };
}
