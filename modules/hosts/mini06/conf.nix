{ self, inputs, ... }:
{
  flake.nixosModules.mini06conf =
    { ... }:
    {
      imports = with self.nixosModules; [
        nixos06hard
        minifeatures
      ];
      # 设备名 网络 hostName TODO 设备名是自定义的，如果你选择修改 mini06 到其他名字，请务必保证其他地方也做了同样的修改
      networking.hostName = "mini06";

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # 将当前 Generation 的配置文件置于 /etc/nixos-config 目录下备用
      environment.etc."nixos-config".source = inputs.self;

      system.stateVersion = "26.05"; # 不要更改这一项，除非你知道自己在做什么
    };
  flake.nixosModules.minifeatures =
    { pkgs, ... }:
    {
      imports = with self.nixosModules; [
        networking
        bootloader
        disko
        locale
        preservation
        system-packages
      ];
      services.xserver = {
        enable = true;
        desktopManager.lxqt.enable = true;
        excludePackages = with pkgs; [ xterm ];
      };
      services.displayManager.sddm.enable = true;
      services.displayManager.defaultSession = "lxqt";
      nix.settings = {
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://cache.nixos.org/"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
        auto-optimise-store = true;
      };
      nixpkgs.config.allowUnfree = true;
    };
}
