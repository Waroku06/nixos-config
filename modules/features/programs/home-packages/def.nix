{ self, inputs, ... }:
{
  flake.nixosModules.home-packages = 
    { ... }:
    {
      imports = with self.nixosModules; [
        game
      ];
    };
  flake.homeModules.home-packages =
    { ... }:
    {
      imports = with self.homeModules; [
        archive-tools
        desktop-apps
        development-tools
        multimedia-apps
        game
      ];
    };
}
