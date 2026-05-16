{ self, inputs, ... }:
{
  flake.nixosModules.nixos06conf =
    { ... }:
    {
      imports = with self.nixosModules; [
        nixos06hard
        features
      ];

      # 设备名 网络 hostName TODO 设备名是自定义的，如果你选择修改 nixos06 到其他名字，请务必保证其他地方也做了同样的修改
      networking.hostName = "nixos06";

      system.stateVersion = "25.11"; # 不要更改这一项，除非你知道自己在做什么！
    };
}
