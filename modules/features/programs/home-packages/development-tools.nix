{ self, inputs, ... }:
{
  flake.homeModules.development-tools =
    { pkgs, inputs, ... }:
    {
      home.packages = with pkgs; [
        # Vulkan 相关
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
        inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher # Minecraft 启动器
        # Nix 语言支持
        nil
        nixd
        marksman # 配合 Kate
        nixfmt # 格式化 Nix 配置文件
        nur.repos.lxl66566.xp3-pack-unpack
      ];
    };
}
