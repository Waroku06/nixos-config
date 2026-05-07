{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.Niri06;
      };
      services.displayManager.defaultSession = "niri";
    };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.Niri06 = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          spawn-at-startup = [
            (lib.getExe self'.packages.Noctalia06)
          ];
          prefer-no-csd = true; # 移除终端等应用的标题栏
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
          input.keyboard.xkb.layout = "us,ua";
          layout.gaps = 5;

          # 禁用触摸板
          input.touchpad = {
            off = _: { };
            natural-scroll = _: { };
            tap = _: { };
          };

          # 特定问题：笔记本合上之后不触发锁屏，需要加上 switch-events 解决
          switch-events = {
            lid-close.spawn = [
              (lib.getExe self'.packages.Noctalia06)
              "ipc"
              "call"
              "lockScreen"
              "lock"
            ];
          };

          binds = {

            "Mod+Return".spawn = lib.getExe pkgs.kitty;
            "Mod+S".spawn-sh = "${lib.getExe self'.packages.Noctalia06} ipc call launcher toggle";
            "Mod+Q".close-window = _: { };
            "Mod+F".maximize-column = _: { };
            "Mod+G".fullscreen-window = _: { };
            "Mod+Shift+F".toggle-window-floating = _: { };
            "Mod+C".center-column = _: { };

            "Mod+H".focus-column-left = _: { };
            "Mod+L".focus-column-right = _: { };
            "Mod+K".focus-window-up = _: { };
            "Mod+J".focus-window-down = _: { };

            "Mod+Left".focus-column-left = _: { };
            "Mod+Right".focus-column-right = _: { };
            "Mod+Up".focus-window-up = _: { };
            "Mod+Down".focus-window-down = _: { };

            "Mod+Shift+H".move-column-left = _: { };
            "Mod+Shift+L".move-column-right = _: { };
            "Mod+Shift+K".move-window-up = _: { };
            "Mod+Shift+J".move-window-down = _: { };

            "Mod+Comma".consume-window-into-column = _: { }; # 逗号
            "Mod+Period".expel-window-from-column = _: { }; # 句号

            "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
            "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
            "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

            "Mod+Ctrl+H".set-column-width = "-5%";
            "Mod+Ctrl+L".set-column-width = "+5%";
            "Mod+Ctrl+J".set-window-height = "-5%";
            "Mod+Ctrl+K".set-window-height = "+5%";

            "Print".screenshot = _: { };
            "Ctrl+Print".screenshot-screen = _: { };
            "Alt+Print".screenshot-window = _: { };

            "Mod+WheelScrollUp".focus-column-left = _: { };
            "Mod+WheelScrollDown".focus-column-right = _: { };
            "Mod+Ctrl+WheelScrollDown".focus-workspace-down = _: { };
            "Mod+Ctrl+WheelScrollUp".focus-workspace-up = _: { };
          };
        };
      };
    };
}
