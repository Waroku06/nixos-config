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
          wechat
          obsidian
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
