{ self, inputs, ... }:
{
  flake.nixosModules.networking =
    { ... }:
    {
      imports = with self.nixosModules; [
        networkmanager
        proxy
      ];
    };

  flake.homeModules.networking =
    { ... }:
    {
      imports = with self.homeModules; [
        auto-clash
      ];
    };
}
