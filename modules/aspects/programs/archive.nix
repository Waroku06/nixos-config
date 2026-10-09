{ inputs, ... }: {
  flake-file.inputs.xp3-brute.url = "github:Waroku06/xp3-brute";
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
        inputs.xp3-brute.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
