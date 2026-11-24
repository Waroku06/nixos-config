{ den, ... }: {
  den.aspects.gui = {
    includes = with den.ful.gui; [
      plasma
      rikka
    ];
    nixos = {
      services.xserver.enable = true;
      services.displayManager.plasma-login-manager.enable = true;
    };
  };
}
