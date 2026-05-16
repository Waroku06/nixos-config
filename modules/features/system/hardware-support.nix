{ self, inputs, ... }:
{
  flake.nixosModules.hardware-support =
    { ... }:
    {
      # 固件 蓝牙 等
      hardware = {
        enableAllFirmware = true; # 自动安装所有固件
        cpu.intel.updateMicrocode = true;
        graphics = {
          enable = true;
          enable32Bit = true;
        };
        bluetooth.enable = true;
      };
    };
}
