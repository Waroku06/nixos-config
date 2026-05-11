{ self, inputs, ... }:
{
  flake.nixosModules.fcitx5 =
    { pkgs, lib, ... }:
    {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.waylandFrontend = true;
        fcitx5.addons = with pkgs; [
          (fcitx5-rime.override {
            rimeDataPkgs = [
              rime-ice
            ];
          }) # 中文
          fcitx5-mozc # 日文
          fcitx5-gtk # GTK 程序支持
          qt6Packages.fcitx5-chinese-addons # 额外中文组件
          qt6Packages.fcitx5-configtool # 图形化配置工具
          fcitx5-fluent # 主题皮肤
        ];
        fcitx5.settings.inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "rime";
          "Groups/0/Items/2".Name = "mozc";
        };
      };
    };
  flake.homeModules.fcitx5 = _: {
    home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
      patch:
        __include: rime_ice_suggestion:/

        schema_list:
          - schema: rime_ice
    '';
  };
}
