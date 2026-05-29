{ self, inputs, ... }:
{
  flake.homeModules.development-tools =
    { pkgs, pkgs-pkun, ... }:
    {
      home.packages = with pkgs; [
        pkgs-pkun.sage
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
