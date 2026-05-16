{ self, inputs, ... }:
{
  flake.nixosModules.system =
    { ... }:
    {
      imports = with self.nixosModules; [
        audio
        bootloader
        cachyos-gamemode
        desktop-session
        fhs-env
        hardware-support
        locale
        nix-settings
        power-management
        system-packages
      ];
    };
}
