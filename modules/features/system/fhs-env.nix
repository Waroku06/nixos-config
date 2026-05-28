{ self, inputs, ... }:
{
  flake.nixosModules.fhs-env =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.nix-alien
        # 在终端输入 fhs 进入 fhs 环境，这样我们就可以在 nixos 中运行非 nixos 包！
        (
          let
            base = pkgs.appimageTools.defaultFhsEnvArgs;
          in
          pkgs.buildFHSEnv (
            base
            // {
              name = "fhs";
              targetPkgs =
                pkgs:
                # pkgs.buildFHSEnv 只提供一个最小的 FHS 环境，缺少很多常用软件所必须的基础包
                # 所以直接使用它很可能会报错
                #
                # pkgs.appimageTools 提供了大多数程序常用的基础包，所以我们可以直接用它来补充
                (base.targetPkgs pkgs)
                ++ (with pkgs; [
                  pkg-config
                  ncurses
                  # 如果你的 FHS 程序还有其他依赖，把它们添加在下面
                ]);
              profile = "export FHS=1";
              runScript = "bash";
              extraOutputsToInstall = [ "dev" ];
            }
          )
        )
      ];
      programs.nix-ld.enable = true;
    };
}
