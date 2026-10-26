{ inputs, ... }: {
  # 常用软件
  flake-file.inputs.linuxqq-wayland-fix.url = "github:SHORiN-KiWATA/linuxqq-wayland-fix";

  den.ful.programs.daily-use = {
    nixos = {
      imports = [ inputs.linuxqq-wayland-fix.nixosModules.default ];
      programs.linuxqq-wayland-fix.enable = true;
    };
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          (wechat.override {
            fetchurl =
              _:
              pkgs.fetchurl {
                url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
                hash = "sha256-RSYYC8qYASh5FZmvEi/0eVACpXFaUQ9qZUgOK+aHQkQ=";
              };
          })
          (obsidian.overrideAttrs (old: {
            src = fetchurl {
              url =
                "https://downloads.sourceforge.net/project/obsidian.mirror/"
                + "v${old.version}/obsidian-${old.version}.tar.gz";
              hash = "sha256-5wt81jeH5/eYqE/sRT9cRGuRh3vT9hLo+5jpt2zIESA=";
            };
          }))
          libreoffice
          wpsoffice-cn
          google-chrome
        ];
        programs.yazi = {
          enable = true;
          enableBashIntegration = true;
          enableFishIntegration = true;
          shellWrapperName = "y";
        };
      };
  };
}
