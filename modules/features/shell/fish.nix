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
        # TODO 设置一些缩写方便使用，你可以根据自己的需要进行增删
        shellAbbrs = {
          f = "fastfetch";
          rc2nix = "nix run github:nix-community/plasma-manager > plasma.nix";
        };
      };
      programs.bash = {
        initExtra = ''
          if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
          then
            shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
            exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
          fi
        '';
      };
    };
}
