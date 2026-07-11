{ self, inputs, ... }:
{
  flake.nixosModules.steam =
    { pkgs, lib, ... }:
    {
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
}
