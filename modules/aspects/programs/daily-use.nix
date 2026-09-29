{
  den.ful.programs.daily-use.homeManager =
    { pkgs, ... }:
    {
      # 常用软件
      home.packages = with pkgs; [
        qq
        (wechat.override {
          fetchurl =
            _:
            pkgs.fetchurl {
              url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
              hash = "sha256-T1StKQLs1vb9xWgLc1R/gNVCO/RwsBI3pXmi5bPK7us=";
            };
        })
        obsidian
        libreoffice
        wpsoffice-cn
        yazi
        google-chrome
      ];
    };
}
