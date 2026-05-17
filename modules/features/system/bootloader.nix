{ self, inputs, ... }:
{
  flake.nixosModules.bootloader =
    { ... }:
    {
      boot.loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 6;
          consoleMode = "max";
          editor = false;
        };
        efi.canTouchEfiVariables = true;
      };
    };
}
