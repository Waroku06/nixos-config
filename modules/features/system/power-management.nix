{ self, inputs, ... }:
{
  flake.nixosModules.power-management =
    { ... }:
    {
      services.upower.enable = true; # 电池电量支持
      services.power-profiles-daemon.enable = true; # 电源模式切换
    };
}
