{ self, inputs, ... }:
{
  flake.homeModules.archive-tools =
    { pkgs, ... }:
    {
      # 解压缩工具
      home.packages = with pkgs; [
        arj
        lrzip
        lzop
        zstd
        libzip
        p7zip
        rar
        zip
        nur.repos.lxl66566.xp3-pack-unpack
      ];
    };
}
