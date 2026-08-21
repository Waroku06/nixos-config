{
  den.ful.programs.daily-use.homeManager =
    { pkgs, pkgs-stable, ... }:
    {
      # 常用软件
      home.packages = with pkgs; [
        qq
        wechat
        pkgs-stable.obsidian
        libreoffice
        wpsoffice-cn
        yazi
        google-chrome
        thunar
      ];
    };
}
