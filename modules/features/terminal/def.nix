{ self, inputs, ... }:
{
  flake.homeModules.terminal =
    { ... }:
    {
      imports = with self.homeModules; [
        kitty
        konsole
      ];
    };
}
