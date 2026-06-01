{ self, inputs, ... }:
{
  flake.nixosModules.preservation =
    { ... }:
    {
      imports = [
        inputs.preservation.nixosModules.preservation
      ];

      # Preservation 的总开关和全局存储位置。
      # 具体需要持久化的文件和目录由对应功能模块按需追加。
      fileSystems."/persistent" = {
        device = "LABEL=persistent";
        fsType = "ext4";
        neededForBoot = true;
        options = [ "nofail" ];
      };

      preservation = {
        enable = true;
        preserveAt."/persistent" = {
          commonMountOptions = [
            "x-gvfs-hide"
            "x-gdu.hide"
          ];

          files = [
            {
              file = "/etc/machine-id";
              inInitrd = true;
            }
            {
              file = "/var/lib/systemd/random-seed";
              how = "symlink";
              inInitrd = true;
              configureParent = true;
            }
          ];

          directories = [
            {
              directory = "/var/lib/nixos";
              inInitrd = true;
            }
            "/var/lib/systemd/timers"
            "/var/log"
          ];
        };
      };

      # /etc/machine-id 通过 bind mount 持久化时不需要该提交服务。
      systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
    };
}
