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
        # disko # TODO 如果不使用 disko，请务必注释掉这一行
        fhs-env
        hardware-support
        locale
        nixpkgs
        power-management
        # preservation # TODO 如果不使用 preservation，请务必注释掉这一行
        system-packages
      ];
    };
}
