{ self, inputs, ... }:
{
  flake.homeModules.development-tools =
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
      programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
        james-yu.latex-workshop
      ];
    };
}
