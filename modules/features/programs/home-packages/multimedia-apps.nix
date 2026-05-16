{ self, inputs, ... }:
{
  flake.homeModules.multimedia-apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # 多媒体
        mpv
        vlc
        haruna
        obs-studio
      ];
    };
}
