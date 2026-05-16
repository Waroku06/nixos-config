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
        sshfs
        javaPackages.compiler.openjdk25 # java25，运行 Minecraft 用
      ];

      # 默认 vim 编辑器
      environment.variables.EDITOR = "vim";
    };
}
