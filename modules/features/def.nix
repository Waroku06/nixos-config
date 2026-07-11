{ self, inputs, ... }:
{
  flake.nixosModules.features =
    { ... }:
    {
      imports = with self.nixosModules; [
        fcitx5
        fonts
        networking
        niri
        plasma
        programs
        shell
        system
        terminal
        virtualisation
      ];
    };

  flake.homeModules.features =
    { ... }:
    {
      imports = with self.homeModules; [
        fcitx5
        fonts
        networking
        plasma
        programs
        shell
        terminal
      ];
    };
}
