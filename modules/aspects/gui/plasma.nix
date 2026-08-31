{ self, inputs, ... }: {
  flake-file.inputs.plasma-manager = {
    url = "github:nix-community/plasma-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };
  den.ful.gui.plasma = { user, ... }: {
    nixos.services.desktopManager.plasma6.enable = true;
    nixos.environment.sessionVariables.NIXOS_OZONE_WL = "1";
    homeManager = {
      imports = [
        inputs.plasma-manager.homeModules.plasma-manager
      ];
      programs.plasma = {
        enable = true;
        shortcuts = {
          "services/kitty.desktop"._launch = "Ctrl+Alt+T";
        };
        # 壁纸路径
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
          katerc.lspclient.AllowedServerCommandLines = "/etc/profiles/per-user/${user.name}/bin/marksman server,/etc/profiles/per-user/${user.name}/bin/nil";
          klipperrc.General.IgnoreImages = false;
          klipperrc.General.MaxClipItems = 1000; # 剪贴板保留 1000 条
          # 光标主题
          kcminputrc.Mouse.cursorTheme = "Breeze_Light";
          # 面板配置
          kwinrc."Tiling/2e99c984-fe41-4b5e-b5b9-b6b05cd14ac1/855463bd-b5a0-4569-8488-b1da5f78770b".padding =
            4;
          kwinrc."Tiling/2e99c984-fe41-4b5e-b5b9-b6b05cd14ac1/855463bd-b5a0-4569-8488-b1da5f78770b".tiles =
            "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
          kwinrc."Tiling/562bedb0-2321-4b97-bcd7-0b5763abdb12/855463bd-b5a0-4569-8488-b1da5f78770b".padding =
            4;
          kwinrc."Tiling/562bedb0-2321-4b97-bcd7-0b5763abdb12/855463bd-b5a0-4569-8488-b1da5f78770b".tiles =
            "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
          kwinrc."Tiling/96ea92a0-b035-4297-9e5e-00bd8ee61220/855463bd-b5a0-4569-8488-b1da5f78770b".padding =
            4;
          kwinrc."Tiling/96ea92a0-b035-4297-9e5e-00bd8ee61220/855463bd-b5a0-4569-8488-b1da5f78770b".tiles =
            "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
          kwinrc."Tiling/9726aed6-f59e-4ad1-8dbe-bf1e87c59404/855463bd-b5a0-4569-8488-b1da5f78770b".padding =
            4;
          kwinrc."Tiling/9726aed6-f59e-4ad1-8dbe-bf1e87c59404/855463bd-b5a0-4569-8488-b1da5f78770b".tiles =
            "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
          kwinrc."Tiling/dc4f0d9d-2445-5410-ad63-6576a9a37b88".tiles =
            "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
          # 输入法
          kwinrc.Wayland."InputMethod[$e]" =
            "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
          # 缩放
          kdeglobals.KScreen.ScaleFactor = 1.45;
          kwinrc.Xwayland.Scale = 1.45;
          # 桌面数量
          kwinrc.Desktops.Number = 1;
          kwinrc.Desktops.Rows = 1;
          # 桌面特效
          kwinrc.Plugins.fallapartEnabled = true;
          kwinrc.Plugins.translucencyEnabled = true;
          kwinrc.Plugins.wobblywindowsEnabled = true;
        };
      };
    };
  };
}
