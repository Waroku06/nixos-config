{ self, inputs, ... }:
{
  flake.nixosModules.fonts =
    { pkgs, lib, ... }:
    {
      console = {
        font = "${pkgs.terminus_font}/share/consolefonts/ter-v32b.psf.gz";
        useXkbConfig = true;
      };
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        maple-mono.NF-CN
        source-han-sans
        source-han-serif
        source-han-mono
      ];
      fonts.fontconfig = {
        enable = true;
        defaultFonts = {
          # 无衬线字体（大多数网页与软件默认）
          sansSerif = [
            "Source Han Sans SC"
            "Source Han Sans HW SC"
            "Noto Sans CJK SC"
            "Noto Sans"
          ];
          # 衬线字体（宋体类）
          serif = [
            "Source Han Serif SC"
            "Source Han Serif HW SC"
            "Noto Serif CJK SC"
            "Noto Serif"
          ];
          # 等宽字体（终端/代码默认）
          monospace = [
            "Maple Mono NF CN"
            "Source Han Mono SC"
            "Noto Sans Mono CJK SC"
            "Noto Sans Mono"
          ];
        };
      };
    };

  flake.homeModules.fonts =
    { ... }:
    {
      # 使用遍黑体，显示更多生僻汉字
      home.file = {
        ".local/share/fonts/PlangothicP1_Regular.ttf".source = ../../../assets/fonts/PlangothicP1_Regular.ttf;
        ".local/share/fonts/PlangothicP2_Regular.ttf".source = ../../../assets/fonts/PlangothicP2_Regular.ttf;
      };
      fonts.fontconfig.enable = true;
    };
}
