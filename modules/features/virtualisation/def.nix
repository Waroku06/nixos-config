{ self, inputs, ... }:
{
  flake.nixosModules.virtualisation =
    { pkgs, ... }:
    {
      virtualisation.vmware.host.enable = true;
    };
}
