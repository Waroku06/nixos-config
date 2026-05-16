{ self, inputs, ... }:
{
  flake.homeModules.desktop-apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # 常用软件
        qq
        wechat
        obsidian
        sageWithDoc
        libreoffice
        wpsoffice-cn
        yazi
        google-chrome
        subtitlecomposer
        thunar
      ];
    };
}
