{ den, ... }: {
  den.aspects.programs.includes = with den.ful.programs; [
    archive
    develop
    daily-use
    fastfetch
    games
    kdeconnect
    multimedia
    nh
    starship
  ];
}
