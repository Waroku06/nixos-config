{ self, inputs, ... }:
{
  flake.nixosModules.locale =
    { ... }:
    {
      # 时区 语言
      time.timeZone = "Asia/Shanghai";
      i18n.defaultLocale = "zh_CN.UTF-8";
      i18n.supportedLocales = [
        "en_US.UTF-8/UTF-8"
        "zh_CN.UTF-8/UTF-8"
        "ja_JP.UTF-8/UTF-8"
      ];
    };
}
