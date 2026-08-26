{
  den.ful.programs.multimedia.homeManager = { pkgs, pkgs-small, ... }: {
    home.packages = with pkgs; [
      mpv
      vlc
      haruna
      obs-studio
      krita
      subtitlecomposer
      flameshot
    ];
  };
}
