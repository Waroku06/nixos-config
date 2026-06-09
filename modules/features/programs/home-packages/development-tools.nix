{ self, inputs, ... }:
{
  flake.homeModules.development-tools =
    { pkgs, pkgs-stable, ... }:
    {
      home.packages = with pkgs; [
        pkgs-stable.sage
        # Nix 语法支持
        nil
        nixd
        marksman
        nixfmt
        # LaTeX 支持
        texliveFull
      ];
    };
}
