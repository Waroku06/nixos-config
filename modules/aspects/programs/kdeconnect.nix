{
  den.ful.programs.kdeconnect.nixos =
    { pkgs, ... }:
    {
      programs.kdeconnect.enable = true;
      environment.systemPackages = [ pkgs.sshfs ];
    };
}
