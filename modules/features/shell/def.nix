{ self, inputs, ... }:
{
  flake.nixosModules.shell =
    { pkgs, lib, ... }:
    {
      programs.fish.enable = true;
    };

  flake.homeModules.shell =
    { ... }:
    {
      imports = with self.homeModules; [
        bash
        fish
      ];
    };
}
