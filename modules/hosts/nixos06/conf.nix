{ self, inputs, ... }:
{
  flake.nixosModules.nixos06conf =
    { pkgs, lib, ... }:
    {
      imports = with self.nixosModules; [
        nixos06hard
        features
      ];

      # 启用性能内核 linux-zen 以及 GameMode
      boot.kernelPackages = pkgs.linuxPackages_zen;
      programs.gamemode.enable = true;

      # 开机
      boot.loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
          useOSProber = true;
        };
      };

      # 设备名 网络 hostName TODO 设备名是自定义的，如果你选择修改 nixos06 到其他名字，请务必保证其他地方也做了同样的修改
      networking.hostName = "nixos06";
      networking.networkmanager.enable = true;
      # 系统级代理设置 TODO 调整成你的代理端口
      networking.proxy = {
        default = "http://127.0.0.1:7890";
        httpProxy = "http://127.0.0.1:7890";
        httpsProxy = "http://127.0.0.1:7890";
        noProxy = "localhost,127.0.0.1,::1,*.local";
      };

      services.upower.enable = true; # 电池电量支持
      services.power-profiles-daemon.enable = true; # 电源模式切换

      # 时区 语言
      time.timeZone = "Asia/Shanghai";
      i18n.defaultLocale = "zh_CN.UTF-8";
      i18n.supportedLocales = [
        "en_US.UTF-8/UTF-8"
        "zh_CN.UTF-8/UTF-8"
        "ja_JP.UTF-8/UTF-8"
      ];

      # 镜像源 flakes 等
      nix.settings = {
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://cache.nixos.org/"
        ];
        trusted-substituters = [ "https://prismlauncher.cachix.org" ]; # prismlauncher
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c=" # prismlauncher
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
      };
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        vim
        git
        wget
        curl
        tree
        sshfs
        javaPackages.compiler.openjdk25 # java25，运行 Minecraft 用
        # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
        (
          let
            base = pkgs.appimageTools.defaultFhsEnvArgs;
          in
          pkgs.buildFHSEnv (
            base
            // {
              name = "fhs";
              targetPkgs =
                pkgs:
                # pkgs.buildFHSEnv 只提供一个最小的 FHS 环境，缺少很多常用软件所必须的基础包
                # 所以直接使用它很可能会报错
                #
                # pkgs.appimageTools 提供了大多数程序常用的基础包，所以我们可以直接用它来补充
                (base.targetPkgs pkgs)
                ++ (with pkgs; [
                  pkg-config
                  ncurses
                  # 如果你的 FHS 程序还有其他依赖，把它们添加在下面
                ]);
              profile = "export FHS=1";
              runScript = "bash";
              extraOutputsToInstall = [ "dev" ];
            }
          )
        )
      ];

      # 默认 vim 编辑器
      environment.variables.EDITOR = "vim";

      # 固件 音频 蓝牙 等
      hardware = {
        enableAllFirmware = true; # 自动安装所有固件
        cpu.intel.updateMicrocode = true;
        graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [
            intel-media-driver
            intel-vaapi-driver
            libvdpau-va-gl
            intel-compute-runtime
          ];
          extraPackages32 = with pkgs.pkgsi686Linux; [
            intel-media-driver
            intel-vaapi-driver
          ];
        };
        bluetooth.enable = true;
      };
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      security.rtkit.enable = true;

      services.xserver.enable = true;
      services.displayManager.gdm.enable = true;
      services.displayManager.gdm.wayland = true;

      system.stateVersion = "25.11"; # 不要更改这一项，除非你知道自己在做什么！
    };
}
