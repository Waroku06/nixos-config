{ self, inputs, ... }:
{
  flake.nixosConfigurations.mini06 = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      mini06conf
      waroku06
    ];
  };
}
