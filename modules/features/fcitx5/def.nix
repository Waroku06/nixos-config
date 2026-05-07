{ self, inputs, ... }:
{
  flake.nixosModules.fcitx5 =
    { pkgs, lib, ... }:
    {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-rime # 中文
          fcitx5-mozc # 日文
          fcitx5-gtk # GTK 程序支持 (如 Firefox)
          qt6Packages.fcitx5-chinese-addons # 额外中文组件（如拼音、拼写检查）
          qt6Packages.fcitx5-configtool # 图形化配置工具
        ];
      };
      environment.variables.XMODIFIERS = "@im=fcitx";
    };
}
