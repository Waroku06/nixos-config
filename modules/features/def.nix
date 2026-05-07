{ self, inputs, ... }:
{
  flake.nixosModules.features =
    { ... }:
    {
      imports = with self.nixosModules; [
        fcitx5
        fonts
        niri
        plasma
        programs
        shell
      ];
    };

  flake.homeModules.features =
    { ... }:
    {
      imports = with self.homeModules; [
        fonts
        plasma
        programs
        shell
        terminal
      ];
    };
}
