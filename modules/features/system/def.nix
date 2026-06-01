{ self, inputs, ... }:
{
  flake.nixosModules.system =
    { ... }:
    {
      imports = with self.nixosModules; [
        audio
        bootloader
        # cachyos-gamemode
        desktop-session
        fhs-env
        hardware-support
        locale
        nixpkgs
        power-management
        preservation
        system-packages
      ];
    };
}
