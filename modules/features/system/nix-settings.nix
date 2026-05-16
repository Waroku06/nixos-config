{ self, inputs, ... }:
{
  flake.nixosModules.nix-settings =
    { ... }:
    {
      # 镜像源 flakes nixpkgs 等
      nix.settings = {
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://cache.nixos.org/"
          "https://attic.xuyh0120.win/lantian" # cachyos-kernel
          "https://cache.garnix.io" # cachyos-kernel
        ];
        trusted-substituters = [ "https://prismlauncher.cachix.org" ]; # prismlauncher
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c=" # prismlauncher
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" # cachyos-kernel
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" # cachyos-kernel
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
      };
      nixpkgs.overlays = [
        inputs.nur.overlays.default
      ];
      nixpkgs.config.allowUnfree = true;
    };
}
