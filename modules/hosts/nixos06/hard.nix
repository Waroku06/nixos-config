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
      # TODO 新设备务必把新的 hardware-configuration.nix 的内容完整地贴进来！
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

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/5087901b-f962-419e-a494-5fd7a5a2193b";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/B792-545D";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };

      # 自动挂载 C 盘 D 盘，挂载点自由调整
      # TODO 如果更换了设备，需要调整下面的 device，换成正确的 UUID，可以输入 lsblk -pf 查看
      fileSystems."/run/media/waroku06/Windows-SSD" = {
        device = "/dev/disk/by-uuid/3C3C90463C8FF962";
        fsType = "ntfs3";
        options = [
          "nofail" # 不要删掉这个
          "uid=1000"
          "gid=100"
          "rw"
          "user"
          "exec"
          "umask=000"
          "windows_names"
        ];
      };

      fileSystems."/run/media/waroku06/Data" = {
        device = "/dev/disk/by-uuid/60041BD7041BAF52";
        fsType = "ntfs3";
        options = [
          "nofail" # 不要删掉这个
          "uid=1000"
          "gid=100"
          "rw"
          "user"
          "exec"
          "umask=000"
          "windows_names"
        ];
      };

      # Swap
      zramSwap = {
        enable = true;
        memoryPercent = 100;
        priority = 100;
      };
      swapDevices = [
        {
          device = "/var/lib/swapfile";
          size = 4096;
          priority = 1;
        }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };

}
