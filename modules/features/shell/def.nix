{ self, inputs, ... }:
{
  flake.nixosModules.shell =
    { ... }:
    {
      imports = with self.nixosModules; [
        bash
        fish
      ];
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
