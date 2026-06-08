{ self, inputs, ... }:
{
  # TODO 请根据需要增删下面的目录和文件，未被声明的目录和文件会存储在 tmpfs 中，重启后会丢失
  flake.nixosModules.preservation = _: {
    imports = [ inputs.preservation.nixosModules.default ];
    boot.tmp.cleanOnBoot = true;
    preservation = {
      enable = true;
      preserveAt."/persist" = {
        directories = [
          "/etc/nixos"
          "/etc/NetworkManager/system-connections"
          {
            directory = "/tmp";
            mode = "1777";
          }
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
        users.waroku06 = {
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
            # preservation 默认挂载中文会有问题，所以需要特殊处理
            {
              directory = "文档";
              how = "symlink";
              createLinkTarget = true;
            }
            {
              directory = "下载";
              how = "symlink";
              createLinkTarget = true;
            }
            {
              directory = "图片";
              how = "symlink";
              createLinkTarget = true;
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
}
