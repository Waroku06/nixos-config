{ self, inputs, ... }:
{
  flake.homeModules.git = _: {
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
  };
}
