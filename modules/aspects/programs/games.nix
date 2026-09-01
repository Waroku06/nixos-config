{ inputs, ... }: {
  flake-file = {
    nixConfig = {
      extra-substituters = [
        "https://prismlauncher.cachix.org"
      ];
      extra-trusted-public-keys = [
        "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
      ];
    };
    inputs.prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher"; # Minecraft 启动器
      # Optional: Override the nixpkgs input of prismlauncher to use the same revision as the rest of your flake
      # Note that this may break the reproducibility mentioned above, and you might not be able to access the binary cache
      #
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  den.ful.programs.games = {
    nixos = {
      # Steam 在 Niri 下黑屏的解决方案
      nixpkgs.overlays = [
        (final: prev: {
          steam = prev.steam.override {
            extraArgs = "-cef-disable-gpu-compositing";
          };
        })
      ];
      programs.steam.enable = true;
    };
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          wineWow64Packages.unstable
          winetricks
          vulkan-loader
          vulkan-validation-layers
          vulkan-tools
          javaPackages.compiler.openjdk25 # java25，运行 Minecraft 用
          inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher
        ];
      };
  };
}
