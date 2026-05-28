{ self, inputs, ... }:
{
  flake.nixosConfigurations.nixos06 = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
      pkgs-stable = import inputs.nixpkgs-stable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      pkgs-pkun = import inputs.nixpkgs-pkun {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
    modules = with self.nixosModules; [
      nixos06conf
      waroku06
    ];
  };
}
