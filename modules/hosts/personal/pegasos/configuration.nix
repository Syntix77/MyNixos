{ self, inputs, ... }:
{

  flake.nixosConfigurations.pegasos = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.Pegasos-Configuration
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

  flake.nixosModules.Pegasos-Configuration =
    { config, pkgs, ... }:

    {
      imports = [
        self.nixosModules.Pegasos-Hardware

        self.nixosModules.sddm
        self.nixosModules.hyprland-wm
        self.nixosModules.fish

        self.nixosModules.fonts
      ];

      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Use latest kernel.
      boot.kernelPackages = pkgs.linuxPackages_latest;

      boot.initrd.luks.devices."luks-00fab94c-e97f-41ae-8949-6c83c72cab2d".device =
        "/dev/disk/by-uuid/00fab94c-e97f-41ae-8949-6c83c72cab2d";
      networking.hostName = "pegasos"; # Define your hostname.

      # Enable networking
      networking.networkmanager.enable = true;
      hardware.bluetooth.enable = true;
      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Set your time zone.
      time.timeZone = "Europe/Berlin";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "de";
        variant = "";
      };

      # Configure console keymap
      console.keyMap = "de";

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.syntix = {
        isNormalUser = true;
        description = "Syntix";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        vim
        wget
        tree
        kitty
        librewolf

        nixd
        nil
        python3
      ];

      system.stateVersion = "25.11"; # Did you read the comment?

    };
}
