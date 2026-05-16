{ self, inputs, ... }:
{
  flake.nixosModules.audio =
    { ... }:
    {
      # 音频服务
      services.pipewire = {
        enable = true;
        # package = pkgs.pipewire;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # 若你需要使用 JACK 应用，取消下面的注释
        jack.enable = true;
        wireplumber.enable = true;
      };
      # rtkit 非必需但推荐
      security.rtkit.enable = true;
      services.pulseaudio.enable = false;
    };
}
