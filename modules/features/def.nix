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
        terminal
      ];
    };

  flake.homeModules.features =
    { ... }:
    {
      imports = with self.homeModules; [
        fcitx5
        fonts
        plasma
        programs
        shell
        terminal
      ];
    };
}
