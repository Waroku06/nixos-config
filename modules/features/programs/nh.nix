{ self, inputs, ... }:
{
  flake.nixosModules.nh =
    { pkgs, lib, ... }:
    {
      programs.nh = {
        enable = true;
        clean = {
          enable = true;
          extraArgs = "--keep-since 3d --keep 6"; # 自动清理 3 天前并且不是最近 6 个的所有世代以节省空间
          dates = "daily"; # 每天清理一次
        };
        flake = "$HOME/nixos-config"; # 你的配置文件路径
      };
    };
}
