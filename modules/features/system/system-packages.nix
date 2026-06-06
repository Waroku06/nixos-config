{ self, inputs, ... }:
{
  flake.nixosModules.system-packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vim
        git
        wget
        curl
        tree
      ];

      # 默认 vim 编辑器
      environment.variables.EDITOR = "vim";
    };
}
