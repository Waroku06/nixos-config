{ self, inputs, ... }:
{
  flake.nixosModules.networkmanager =
    { ... }:
    {
      networking.networkmanager.enable = true;
    };
}
