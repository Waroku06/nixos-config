{ self, inputs, ... }:
{
  flake.homeModules.vscode =
    { pkgs, lib, ... }:
    {
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          ms-ceintl.vscode-language-pack-zh-hans
        ];
      };
    };
}
