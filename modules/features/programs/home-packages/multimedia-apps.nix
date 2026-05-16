{ self, inputs, ... }:
{
  flake.homeModules.multimedia-apps =
    { pkgs, ... }:
    {
      # 多媒体
      home.packages = with pkgs; [
        mpv
        vlc
        haruna
        obs-studio
      ];
    };
}
