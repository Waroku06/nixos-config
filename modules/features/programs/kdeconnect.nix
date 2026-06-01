{ self, inputs, ... }:
{
  flake.nixosModules.kdeconnect =
    { pkgs, lib, ... }:
    {
      programs.kdeconnect.enable = true;

      preservation.preserveAt."/persistent".users.waroku06.directories = [
        ".config/kdeconnect"
      ];
    };
}
