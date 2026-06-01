{ self, inputs, ... }:
{
  flake.nixosModules.programs =
    { ... }:
    {
      imports = with self.nixosModules; [
        home-packages
        kdeconnect
        steam
        nh
        vscode
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
