{ self, inputs, ... }:
{
  flake.homeModules.development-tools =
    { pkgs, inputs, ... }:
    {
      home.packages = with pkgs; [
        # Nix 语法支持
        nil
        nixd
        marksman
        nixfmt
      ];
    };
}
