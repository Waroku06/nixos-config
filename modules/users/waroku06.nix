{ self, inputs, ... }:
{
  # TODO 默认的用户名是 waroku06，如果想修改，请把所有其他使用用户名的地方也作出同样修改
  flake.nixosModules.waroku06 =
    { pkgs, inputs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
        users.waroku06 = self.homeModules.waroku06;
        extraSpecialArgs = { inherit inputs; };
        # 防止与 Plasma 图形化设置冲突
        backupFileExtension = "backup";
        overwriteBackup = true;
      };

      users.users.waroku06 = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "input"
          "video"
        ];
      };
      security.sudo.wheelNeedsPassword = false; # sudo 是否需要密码，如果需要的话请改为 true
    };

  flake.homeModules.waroku06 =
    {
      config,
      pkgs,
      lib,
      pkgs-stable,
      inputs,
      ...
    }:
    {
      imports = [
        self.homeModules.features
      ];

      home.username = "waroku06";
      home.homeDirectory = "/home/waroku06";

      home.packages = with pkgs; [
        arj
        lrzip
        lzop
        zstd
        libzip
        p7zip
        rar
        zip # 解压缩工具
        qq
        wechat
        obsidian
        sageWithDoc
        wineWow64Packages.unstable
        winetricks
        mpv
        vlc
        haruna
        libreoffice
        yazi
        google-chrome
        subtitlecomposer
        obs-studio
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
        inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher # Minecraft 启动器
        nil
        marksman # 配合 Kate
        nixfmt # 格式化 Nix 配置文件
      ];

      # 开机自动启动 Clash 代理 TODO 根据需要自行调整命令
      systemd.user.services.auto-cl = {
        Unit = {
          Description = "Auto run cl command on startup";
          After = [ "network-online.target" ];
          Wants = [ "network-online.target" ];
        };
        Service = {
          ExecStart = "${pkgs.fish}/bin/fish -c '/home/waroku06/clash/clash -d /home/waroku06/clash/'";
          Restart = "on-failure";
          RestartSec = "5s";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };

      # This value determines the Home Manager release that your
      # configuration is compatible with. This helps avoid breakage
      # when a new Home Manager release introduces backwards
      # incompatible changes.
      #
      # You can update Home Manager without changing this value. See
      # the Home Manager release notes for a list of state version
      # changes in each release.
      home.stateVersion = "25.11";
    };
}
