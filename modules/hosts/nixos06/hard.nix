{ self, inputs, ... }:
{
  flake.nixosModules.nixos06hard =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:

    {
      # TODO 新设备注意把新的 hardware-configuration.nix 内容对应进来
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    };
}
