{ self, inputs, ... }:
{
  flake.nixosModules.disko = _: {
    # TODO 这里的配置是结合 preservation 模块的，如有需要请自行调整

    imports = [ inputs.disko.nixosModules.disko ];
    fileSystems."/nix".neededForBoot = true;
    fileSystems."/persist".neededForBoot = true; # sometimes needed too

    disko.devices.nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=50%"
          "mode=755"
        ];
      };
    };

    disko.devices.disk.main = {
      # TODO 需要把目标设备写在这里，推荐使用 ID，通过以下命令查看: ls -l /dev/disk/by-id
      device = "/dev/disk/by-id/nvme-UMIS_RPJYJ512MKN1QWY_SS1K16471Z2CD3AY2373";
      type = "disk";
      content.type = "gpt";

      content.partitions.boot = {
        name = "boot";
        size = "1M";
        type = "EF02";
      };
      content.partitions.esp = {
        name = "ESP";
        size = "1G";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
        };
      };

      content.partitions.swap = {
        size = "16G";
        content = {
          type = "swap";
          resumeDevice = true;
        };
      };

      content.partitions.root = {
        name = "root";
        size = "100%";
        content = {
          type = "btrfs";
          extraArgs = [ "-f" ];
          subvolumes = {
            "/persist" = {
              mountOptions = [
                "subvol=persist"
                "compress=zstd:1"
                "noatime"
              ];
              mountpoint = "/persist";
            };
            "/nix" = {
              mountOptions = [
                "subvol=nix"
                "compress=zstd:1"
                "noatime"
              ];
              mountpoint = "/nix";
            };
          };
        };
      };
    };
  };
}
