{ self, inputs, ... }:
{
  flake.nixosModules.steam =
    { pkgs, lib, ... }:
    {
      nixpkgs.overlays = [
        (final: prev: {
          steam = prev.steam.override {
            extraArgs = "-cef-disable-gpu-compositing";
          };
        })
      ];
      programs.steam.enable = true;

      preservation.preserveAt."/persistent".users.waroku06.directories = [
        ".local/share/Steam"
      ];
    };
}
