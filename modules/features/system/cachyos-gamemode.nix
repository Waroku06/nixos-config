{ self, inputs, ... }:
{
  flake.nixosModules.cachyos-gamemode =
    { pkgs, ... }:
    {
      # 启用性能内核 cachyos 以及 GameMode
      nixpkgs.overlays = [
        inputs.nix-cachyos-kernel.overlays.pinned
      ];
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
      programs.gamemode.enable = true;
    };
}
