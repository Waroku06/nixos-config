{ self, inputs, ... }:
{
  flake.nixosModules.plasma =
    { pkgs, lib, ... }:
    {
      services.desktopManager.plasma6.enable = true;
    };

  flake.homeModules.plasma = _: {
    # Plasma Manager 配置
    programs.plasma = {
      enable = true;
      shortcuts = {
        "services/kitty.desktop"._launch = "Ctrl+Alt+T";
      };
      # 壁纸：建议换成你自己稳定放置的路径
      kscreenlocker.appearance.wallpaper = "${self}/assets/wallpaper/121023003.jpg";
      workspace.wallpaper = "${self}/assets/wallpaper/121023003.jpg";
      workspace.lookAndFeel = "org.kde.breeze.desktop";
      configFile = {
        # 语言
        plasma-localerc.Formats.LANG = "zh_CN.UTF-8";
        # 键盘布局
        kxkbrc.Layout.Use = true;
        kxkbrc.Layout.LayoutList = "us";
        kxkbrc.Layout.VariantList = "";
        kxkbrc.Layout.DisplayNames = "";
        # 基本界面习惯
        kdeglobals.KDE.SingleClick = true;
        kdeglobals.General.TerminalApplication = "kitty";
        kdeglobals.General.TerminalService = "kitty.desktop";

        kdeglobals."KFileDialog Settings"."Show hidden files" = false;
        kdeglobals."KFileDialog Settings"."Show Preview" = false;
        kdeglobals."KFileDialog Settings"."Sort directories first" = true;
        kdeglobals."KFileDialog Settings"."Automatically select filename extension" = true;
        kdeglobals."KFileDialog Settings"."Breadcrumb Navigation" = true;
        kdeglobals."KFileDialog Settings"."Show Full Path" = false;
        kdeglobals."KFileDialog Settings"."Show Speedbar" = true;
        kdeglobals."KFileDialog Settings"."View Style" = "DetailTree";
        katerc."KTextEditor Renderer"."Text Font" = "Monospace,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        katerc.lspclient.AllowedServerCommandLines = "/etc/profiles/per-user/waroku06/bin/marksman server,/etc/profiles/per-user/waroku06/bin/nil";
        # 触摸板：这里是你机器上的设备名，别的机器可能要改
        # 不确定时可以先不用这一段
        # kcminputrc."Libinput/你的设备名".Enabled = false;
        # 光标主题
        kcminputrc.Mouse.cursorTheme = "Breeze_Light";
        # Wayland 下输入法
        kwinrc.Wayland."InputMethod[$e]" =
          "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
        # 缩放
        kdeglobals.KScreen.ScaleFactor = 1.45;
        kwinrc.Xwayland.Scale = 1.45;
        # 桌面数量
        kwinrc.Desktops.Number = 1;
        kwinrc.Desktops.Rows = 1;
        # 桌面特效：惯性晃动、粉碎动画、透明度
        kwinrc.Plugins.fallapartEnabled = true;
        kwinrc.Plugins.translucencyEnabled = true;
        kwinrc.Plugins.wobblywindowsEnabled = true;
      };
    };
  };

}
