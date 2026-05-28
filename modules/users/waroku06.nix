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
        extraSpecialArgs = {
          inherit inputs;
          pkgs-stable = import inputs.nixpkgs-stable {
            system = pkgs.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
          pkgs-pkun = import inputs.nixpkgs-pkun {
            system = pkgs.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        };
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
    { ... }:
    {
      imports = [
        self.homeModules.features
      ];

      home.username = "waroku06";
      home.homeDirectory = "/home/waroku06";

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
