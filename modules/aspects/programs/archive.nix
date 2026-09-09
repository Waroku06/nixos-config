{
  den.ful.programs.archive.homeManager =
    { pkgs, ... }:
    {
      # 解压缩工具
      home.packages = with pkgs; [
        unzip
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
