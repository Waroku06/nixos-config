{
  den.ful.programs.daily-use.homeManager =
    { pkgs, ... }:
    {
      # 常用软件
      home.packages = with pkgs; [
        qq
        wechat
        obsidian
        libreoffice
        wpsoffice-cn
        yazi
        google-chrome
      ];
    };
}
