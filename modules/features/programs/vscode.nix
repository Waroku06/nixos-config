{ self, inputs, ... }:
{
  flake.homeModules.vscode =
    { pkgs, lib, ... }:
    {
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = true;
        package = pkgs.vscode;
        profiles.default.extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide # Nix 语法支持
          eamodio.gitlens # 增强型 Git 管理
          ms-ceintl.vscode-language-pack-zh-hans # 简体中文
          james-yu.latex-workshop # LaTeX 支持
        ];
      };
    };
}
