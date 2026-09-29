{ inputs, ... }: {
  flake-file = {
    inputs = {
      codex-desktop-linux = {
        url = "github:ilysenko/codex-desktop-linux";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      xiongchenyu6.url = "github:xiongchenyu6/nur-packages";
    };
  };
  den.ful.programs.ai.homeManager = { pkgs, ... }: {
    imports = [ inputs.codex-desktop-linux.homeManagerModules.default ];
    programs.codexDesktopLinux = {
      enable = true;
      linuxFeatures = [ "ui-tweaks" ];
    };
    home.packages = [
      inputs.xiongchenyu6.packages.${pkgs.stdenv.hostPlatform.system}.cc-switch
    ];
  };
}
