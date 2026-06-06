{ self, inputs, ... }:
{
  flake.nixosConfigurations.mini06 = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      mini06conf
      miniwaroku06
    ];
  };
  # TODO 默认的用户名是 waroku06，如果想修改，请把所有其他使用用户名的地方也作出同样修改
  flake.nixosModules.miniwaroku06 =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.waroku06 = self.homeModules.miniwaroku06;
      };
      # NOTE home-manager 有关 nixpkgs 的设置在 modules/features/system/nixpkgs.nix 中

      users.users.waroku06 = {
        isNormalUser = true;
        hashedPasswordFile = "/persist/passwd";
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
    flake.homeModules.miniwaroku06 =
    { ... }:
    {
      imports = [
        self.homeModules.minifeatures
      ];

      home.username = "waroku06";
      home.homeDirectory = "/home/waroku06";

      home.stateVersion = "26.05"; # 不要更改这一项，除非你知道自己在做什么
    };
    flake.homeModules.minifeatures =
    { ... }:
    {
      imports = with self.homeModules; [
        fcitx5
        networking
        shell
      ];
    };
}
