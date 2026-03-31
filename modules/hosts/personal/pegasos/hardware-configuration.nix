{ self, inputs, ... }:
{

  flake.nixosModules.Pegasos-Hardware =
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
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "uas"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/mapper/luks-c3861ab0-9894-4370-ad93-971fd8e64409";
        fsType = "btrfs";
        options = [ "subvol=@" ];
      };

      boot.initrd.luks.devices."luks-c3861ab0-9894-4370-ad93-971fd8e64409".device =
        "/dev/disk/by-uuid/c3861ab0-9894-4370-ad93-971fd8e64409";

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/08E7-7DFE";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      fileSystems."/home" = {
        device = "/dev/mapper/luks-6ea25255-ec39-49df-a7da-e6eaaf102c1b";
        fsType = "btrfs";
      };

      boot.initrd.luks.devices."luks-6ea25255-ec39-49df-a7da-e6eaaf102c1b".device =
        "/dev/disk/by-uuid/6ea25255-ec39-49df-a7da-e6eaaf102c1b";

      swapDevices = [
        { device = "/dev/mapper/luks-00fab94c-e97f-41ae-8949-6c83c72cab2d"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
