{ self, inputs, ... }:
{
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          # TODO 改成自己的名字和邮箱
          name = "Waroku06";
          email = "178467046+Waroku06@users.noreply.github.com";
        };
      };
    };
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          # TODO 改成自己的名字和邮箱
          name = "Waroku06";
          email = "178467046+Waroku06@users.noreply.github.com";
        };
      };
    };
    programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      visualjj.visualjj
    ];
  };
}
