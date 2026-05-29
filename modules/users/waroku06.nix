{ self, inputs, ... }:
{
  # TODO 默认的用户名是 waroku06，如果想修改，请把所有其他使用用户名的地方也作出同样修改
  flake.nixosModules.waroku06 =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
        users.waroku06 = self.homeModules.waroku06;
        # 防止与 Plasma 图形化设置冲突
        backupFileExtension = "backup";
        overwriteBackup = true;
      };
      # NOTE home-manager 有关 nixpkgs 的设置在 modules/features/system/nixpkgs.nix 中

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

      home.stateVersion = "25.11"; # 不要更改这一项，除非你知道自己在做什么
    };
}
