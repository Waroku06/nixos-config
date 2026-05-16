{ self, inputs, ... }:
{
  flake.homeModules.game =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        wineWow64Packages.unstable
        winetricks
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
        inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher # Minecraft 启动器
      ];
    };
}
