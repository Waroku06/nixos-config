{ self, inputs, ... }:
{
  flake.nixosModules.desktop-session =
    { ... }:
    {
      services.xserver.enable = true;
      services.displayManager.plasma-login-manager.enable = true;
    };
}
