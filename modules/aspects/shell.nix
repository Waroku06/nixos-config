# TODO shell 没有怎么配置，主要是别名，你可以根据自己的需要进行增删
let
  aliases = {
    f = "fastfetch";
    rc2nix = "nix run github:nix-community/plasma-manager > plasma.nix";
    mathematica = "steam-run /home/waroku06/Wolfram/Wolfram/15.0.1/Executables/WolframNB";
    maple = "_JAVA_AWT_WM_NONREPARENTING=1 fhs /home/waroku06/maple2022/bin/xmaple";
  };
in
{
  den.aspects.shell = {
    homeManager = {
      programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = aliases;
      };
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        shellAbbrs = aliases;
      };
    };
  };
}
