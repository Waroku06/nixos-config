{ self, inputs, ... }:
{
  flake.nixosModules.preservation = _: {
    imports = [ inputs.preservation.nixosModules.default ];
    boot.tmp.cleanOnBoot = true;
    preservation = {
      enable = true;
      preserveAt."/persist" = {
        directories = [
          "/etc/nixos"
          "/etc/NetworkManager/system-connections"
          "/tmp"
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
            "linshi0606"
            "Documents"
            "Pictures"
            "文档"
            "图片"
            "clash"
            "aboutmath"
            ".local/share/fish"
            ".local/share/Steam"
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
