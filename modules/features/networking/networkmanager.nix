{ self, inputs, ... }:
{
  flake.nixosModules.networkmanager =
    { ... }:
    {
      networking.networkmanager.enable = true;

      preservation.preserveAt."/persistent" = {
        directories = [
          {
            directory = "/etc/NetworkManager/system-connections";
            mode = "0700";
          }
          "/var/lib/NetworkManager"
        ];
      };
    };
}
