{ self, inputs, ... }:
{
  flake.homeModules.wine-tools =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        wineWow64Packages.unstable
        winetricks
      ];
    };
}
