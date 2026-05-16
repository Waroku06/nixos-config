{ self, inputs, ... }:
{
  flake.homeModules.archive-tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # 解压缩工具
        arj
        lrzip
        lzop
        zstd
        libzip
        p7zip
        rar
        zip
      ];
    };
}
