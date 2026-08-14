{ den, ... }: {
  den.aspects.gui = {
    includes = with den.ful.gui; [
      # niri
      # noctalia
      plasma
    ];
    nixos = {
      services.xserver.enable = true;
      services.displayManager.plasma-login-manager.enable = true;
    };
  };
}
