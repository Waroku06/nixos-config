{ self, inputs, ... }:
{
  flake.nixosModules.nixpkgs =
    { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      pkgx = {
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-pkun = import inputs.nixpkgs-pkun {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      # 镜像源 flakes nixpkgs 等
      nix.settings = {
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://cache.nixos.org/"
          # "https://attic.xuyh0120.win/lantian" # cachyos-kernel
        ];
        trusted-substituters = [ "https://prismlauncher.cachix.org" ]; # prismlauncher
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c=" # prismlauncher
          # "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" # cachyos-kernel
        ];
        auto-optimise-store = true;
      };
      nixpkgs.overlays = [
        inputs.nur.overlays.default
      ];
      nixpkgs.config.allowUnfree = true;
      _module.args = pkgx;
      home-manager.extraSpecialArgs = pkgx;
    };
}
