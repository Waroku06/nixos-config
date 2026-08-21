{
  den.ful.programs.multimedia.homeManager = { pkgs, pkgs-small, ... }: {
    home.packages = with pkgs; [
      pkgs-small.mpv
      vlc
      pkgs-small.haruna
      obs-studio
      krita
      subtitlecomposer
      flameshot
    ];
  };
}
