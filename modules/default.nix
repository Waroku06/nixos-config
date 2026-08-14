{
  lib,
  inputs,
  den,
  __findFile,
  ...
}:
let
  stateVersion = "26.05";
in
{
  # flake.den = den; # debug 后需禁用
  # den 尖括号语法
  _module.args.__findFile = den.lib.__findFile;
  # 默认启用 homeManager
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
  flake-file.inputs.nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  # 全局设置
  den.default = {
    nixos = { pkgs, ... }: {
      # 启用实验性内容
      nix.settings.experimental-features = [
        "flakes"
        "nix-command"
      ];
      # 本地化
      time.timeZone = lib.mkDefault "Asia/Shanghai";
      i18n.defaultLocale = lib.mkDefault "zh_CN.UTF-8";
      i18n.supportedLocales = [
        "en_US.UTF-8/UTF-8"
        "zh_CN.UTF-8/UTF-8"
        "ja_JP.UTF-8/UTF-8"
      ];
      # 音频服务
      services.pipewire = {
        enable = true;
        # package = pkgs.pipewire;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # 若你需要使用 JACK 应用，取消下面的注释
        jack.enable = true;
        wireplumber.enable = true;
      };
      # rtkit 非必需但推荐
      security.rtkit.enable = true;
      services.pulseaudio.enable = false;
      # bootloader 设置
      boot.loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 6;
          consoleMode = "max";
          editor = false;
        };
        efi.canTouchEfiVariables = true;
      };
      # 默认使用 cachyos 内核
      nix.settings = {
        substituters = [
          "https://attic.xuyh0120.win/lantian" # cachyos-kernel
        ];
        trusted-public-keys = [
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" # cachyos-kernel
        ];
      };
      nixpkgs.overlays = [
        inputs.nix-cachyos-kernel.overlays.pinned
      ];
      boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-latest;
      programs.gamemode.enable = lib.mkDefault true;

      hardware.bluetooth.enable = true; # 蓝牙支持
      services.upower.enable = true; # 电池电量支持
      services.power-profiles-daemon.enable = true; # 电源模式切换
      # 内置系统应用
      environment.systemPackages = with pkgs; [
        vim
        git
        wget
        curl
        tree
      ];
      # 默认 vim 编辑器
      environment.variables.EDITOR = "vim";

      system.stateVersion = lib.mkDefault stateVersion;
    };
    homeManager.home.stateVersion = lib.mkDefault stateVersion;
  };
}
