{ ... }: {
  den.ful.programs.develop.homeManager =
    { pkgs, pkgs-stable, ... }:
    {
      home.packages = with pkgs; [
        pkgs-stable.sage
        geogebra6
        # Nix 语法支持
        nil
        nixd
        marksman
        nixfmt
        # LaTeX 支持
        texliveFull
      ];
      programs.opencode.enable = true;
      programs.codex.enable = true;
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
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          ms-ceintl.vscode-language-pack-zh-hans
          james-yu.latex-workshop
          eamodio.gitlens
          visualjj.visualjj
        ];
      };
    };
}
