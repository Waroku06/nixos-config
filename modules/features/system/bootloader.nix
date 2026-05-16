{ self, inputs, ... }:
{
  flake.nixosModules.bootloader =
    { ... }:
    {
      boot.loader = {
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
          useOSProber = true;
        };
      };
    };
}
