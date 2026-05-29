{ self, inputs, ... }:
{
  flake.nixosConfigurations.nixos06 = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      nixos06conf
      waroku06
    ];
  };
}
