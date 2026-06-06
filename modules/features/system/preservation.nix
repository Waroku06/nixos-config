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
          ];
          #   files = [
          #
          #   ];
        };
      };
    };
  };
}
