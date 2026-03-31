{ self, inputs, ... }:
{
  flake.nixosConfigurations.hydra = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.Hydra-Configuration
      inputs.home-manager.nixosModules.home-manager
      inputs.agenix.nixosModules.default
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
        home-manager.users.syntix = self.homeModules.syntix;
      }
    ];
  };

  flake.nixosModules.Hydra-Configuration = {
    imports = [
      self.nixosModules.Hydra-Hardware
      self.nixosModules.boot-systemd
      self.nixosModules.boot-kernel

      self.nixosModules.syntix
    ];

    networking.hostName = "hydra";

    system.stateVersion = "25.05";
  };
}
