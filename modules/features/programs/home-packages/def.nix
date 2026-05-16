{ self, inputs, ... }:
{
  flake.homeModules.home-packages =
    { ... }:
    {
      imports = with self.homeModules; [
        archive-tools
        desktop-apps
        development-tools
        multimedia-apps
        wine-tools
      ];
    };
}
