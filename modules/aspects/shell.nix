# TODO shell 没有怎么配置，主要是别名，你可以根据自己的需要进行增删
let
  aliases = {
    f = "fastfetch";
    rc2nix = "nix run github:nix-community/plasma-manager > plasma.nix";
    mathematica = "steam-run /home/waroku06/Wolfram/Wolfram/15.0.1/Executables/WolframNB";
    maple = "_JAVA_AWT_WM_NONREPARENTING=1 fhs /home/waroku06/maple2022/bin/xmaple";
    hm-gen = "nix-env -p ~/.local/state/nix/profiles/home-manager --list-generations";
    pxyuns = ''export http_proxy="http://192.168.1.5:8502" && export https_proxy="http://192.168.1.5:8502" && nohup google-chrome --proxy-server="http://192.168.1.5:8502" > /dev/null 2>&1 & disown'';
  };
in
{
  den.aspects.shell = {
    homeManager = {
      programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = aliases;
        initExtra = ''
            hm-rollback() {
            if [ -z "$1" ]; then
            echo "用法: hm-rollback <ID>"
            return 1
          fi
          local script="$HOME/.local/state/nix/profiles/home-manager-$1-link/activate"
          if [ -x "$script" ]; then
            "$script"
          else
            echo "找不到对象: $script"
          fi
            }
        '';
      };
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        shellAbbrs = aliases;
        functions = {
          hm-rollback = ''
            if test -z "$argv[1]"
                echo "用法: hm-rollback <ID>"
                return 1
            end

            set target "$HOME/.local/state/nix/profiles/home-manager-$argv[1]-link/activate"

            if test -x "$target"
                eval "$target"
            else
                echo "找不到对象: $target"
            end
          '';
        };
      };
    };
  };
}
