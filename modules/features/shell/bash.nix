{ self, inputs, ... }:
{
  flake.homeModules.bash =
    { pkgs, lib, ... }:
    {
      programs.bash = {
        enable = true;
        enableCompletion = true;
        # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
        shellAliases = {
          f = "fastfetch";
          rc2nix = "nix run github:nix-community/plasma-manager > plasma.nix";
          mathematica = "/home/waroku06/Wolfram/Wolfram/14.3/Executables/WolframNB"; # 请先进入 fhs
          maple = "_JAVA_AWT_WM_NONREPARENTING=1 /home/waroku06/maple2022/bin/xmaple"; # 请先进入 fhs
        };
      };

    };
}
