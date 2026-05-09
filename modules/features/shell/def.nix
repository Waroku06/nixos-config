{ self, inputs, ... }:
{
  flake.homeModules.shell =
    { ... }:
    {
      imports = with self.homeModules; [
        bash
        fish
      ];
    };
}
