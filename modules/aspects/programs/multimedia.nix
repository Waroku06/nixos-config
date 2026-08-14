{
  den.ful.programs.multimedia.homeManager = { pkgs, ... }: {
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
