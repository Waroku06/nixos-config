{ self, inputs, ... }:
{
  flake.homeModules.fish =
    { pkgs, lib, ... }:
    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
        shellAbbrs = {
          f = "fastfetch";
          rc2nix = "nix run github:nix-community/plasma-manager > plasma.nix";
        };
      };
    };
}
