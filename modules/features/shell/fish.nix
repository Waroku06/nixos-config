{ self, inputs, ... }:
{
  flake.nixosModules.fish = 
    { pkgs, lib, ... }:
    {
      programs.fish.enable = true;
    };
  flake.homeModules.fish =
    { pkgs, lib, ... }:
    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        # TODO 设置一些缩写方便使用，你可以根据自己的需要进行增删
        shellAbbrs = {
          f = "fastfetch";
          rc2nix = "nix run github:nix-community/plasma-manager > plasma.nix";
          mathematica = "steam-run /home/waroku06/Wolfram/Wolfram/14.3/Executables/WolframNB";
          maple = "_JAVA_AWT_WM_NONREPARENTING=1 steam-run /home/waroku06/maple2022/bin/xmaple";
        };
      };
    };
}
