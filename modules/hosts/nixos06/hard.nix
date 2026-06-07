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
      # 如果你启用了 disko 模块，请把下方 fileSystems, zramSwap, swapDevices 删去
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

      # TODO 新设备需要调整下面的 device，可以输入 lsblk -pf 查看要使用的分区，
      # 用 nixos-generate-config 生成的 UUID 即可，也可以使用 LABEL 来指定分区。
      # 注意，如果使用 LABEL 来指定分区，确保分区的 LABEL 是唯一的，否则可能会导致系统无法正确识别分区。
      fileSystems."/" = {
        device = "LABEL=nixos";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "LABEL=boot";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };
      # 自动挂载 C 盘 D 盘
      fileSystems."/run/media/waroku06/Windows-SSD" = {
        device = "LABEL=Windows-SSD";
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
        device = "LABEL=Data";
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

      # Swap，不单独分区
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
