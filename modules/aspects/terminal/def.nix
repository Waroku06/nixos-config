{ den, ... }: {
  den.aspects.terminal.includes = with den.ful.terminal; [
    kitty
    konsole
  ];
}
