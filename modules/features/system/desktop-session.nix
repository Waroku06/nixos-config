{ self, inputs, ... }:
{
  flake.nixosModules.desktop-session =
    { ... }:
    {
      services.xserver.enable = true;
      services.displayManager.gdm.enable = true;
      services.displayManager.gdm.wayland = true;
    };
}
