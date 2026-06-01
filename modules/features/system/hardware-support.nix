{ self, inputs, ... }:
{
  flake.nixosModules.hardware-support =
    { ... }:
    {
      # 固件 蓝牙 等
      imports = with inputs.nixos-hardware.nixosModules; [
        common-cpu-intel
        common-pc-laptop
        common-pc-laptop-ssd
      ];
      hardware = {
        enableAllFirmware = true; # 自动安装所有固件
        cpu.intel.updateMicrocode = true;
        graphics = {
          enable = true;
          enable32Bit = true;
        };
        bluetooth.enable = true;
      };

      preservation.preserveAt."/persistent".directories = [
        "/var/lib/bluetooth"
      ];
    };
}
