{ self, inputs, ... }:
let
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.nixos06 = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

    };
    modules = with self.nixosModules; [
      nixos06conf
      waroku06
    ];
  };
}
