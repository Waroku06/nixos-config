{ self, inputs, ... }:
{
  flake.nixosModules.programs =
    { ... }:
    {
      imports = with self.nixosModules; [
        kdeconnect
        steam
        nh
      ];
    };

  flake.homeModules.programs =
    { ... }:
    {
      imports = with self.homeModules; [
        fastfetch
        git
        home-packages
        starship
        vscode
      ];
    };
}
