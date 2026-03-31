{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        font-awesome
        nerd-fonts.symbols-only
        jetbrains-mono
      ];
    };
}
