{ self, inputs, ... }:
{
  flake.nixosModules.mini06conf =
    { ... }:
    {
      imports = with self.nixosModules; [
        nixos06hard
        features
      ];
      # 设备名 网络 hostName TODO 设备名是自定义的，如果你选择修改 mini06 到其他名字，请务必保证其他地方也做了同样的修改
      networking.hostName = "mini06";

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # 将当前 Generation 的配置文件置于 /etc/nixos-config 目录下备用
      environment.etc."nixos-config".source = inputs.self;

      system.stateVersion = "26.05"; # 不要更改这一项，除非你知道自己在做什么
    };
}
