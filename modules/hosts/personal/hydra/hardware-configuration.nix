{ self, inputs, ... }:
{

  flake.nixosModules.Hydra-Hardware =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {

      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "uas"
        "usbhid"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/3c64fc2a-ffbc-4323-a9af-b34562a65fa9";
        fsType = "btrfs";
        options = [ "subvol=@" ];
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/E653-39D3";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      fileSystems."/home" = {
        device = "/dev/disk/by-uuid/7c2ff940-cd28-4d24-82fa-33ceed1852e1";
        fsType = "btrfs";
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/693d6bbc-6a5c-4cb9-a22f-4f4a9b9ad47d"; }
      ];

      # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
      # (the default) this is the recommended approach. When using systemd-networkd it's
      # still possible to use this option, but it's recommended to use it in conjunction
      # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
      networking.useDHCP = lib.mkDefault true;
      # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
      # networking.interfaces.wlp11s0.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    };
}
