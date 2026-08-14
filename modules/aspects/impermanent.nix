{ inputs, ... }: {
  flake-file.inputs = {
    preservation.url = "github:nix-community/preservation";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  # disko + preservation
  den.aspects.impermanent = device: swapsize: {
    nixos = { host, user, ... }: {
      imports = [
        inputs.disko.nixosModules.disko
        inputs.preservation.nixosModules.default
      ];
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
        inherit device;
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
          size = "${toString swapsize}G";
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
      preservation = {
        enable = true;
        preserveAt."/persist" = {
          directories = [
            "/etc/nixos"
            "/etc/NetworkManager/system-connections"
            "/var/lib/bluetooth"
            "/var/lib/systemd/timers"
            "/var/log"
            {
              directory = "/var/lib/nixos";
              inInitrd = true;
            }
          ];

          files = [
            {
              file = "/etc/machine-id";
              inInitrd = true;
            }
          ];

          # Preserve user files
          users.${user.name} = {
            directories = [
              ".cache"
              ".local"
              ".config"
              ".wine"
              ".steam"
              "nixos-config"
              "Documents"
              "Pictures"
              "linshi0606"
              "clash"
              "aboutmath"
              # preservation 默认挂载中文会有问题，所以改用软链接的方式
              {
                directory = "文档";
                how = "symlink";
              }
              {
                directory = "下载";
                how = "symlink";
              }
              {
                directory = "图片";
                how = "symlink";
              }
            ];
            files = [
              ".bash_history"
            ];
          };
        };
      };
      # systemd-machine-id-commit.service would fail but it is not relevant
      # in this specific setup for a persistent machine-id so we disable it
      systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
    };
  };
}
