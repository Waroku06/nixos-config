{ __findFile, ... }:
{
  den.aspects.daily-use.includes = [
    <den/hostname>
    <den/define-user>
    <den/primary-user>
    <den/host-aspects>
    (<den/user-shell> "fish")
    <gui>
    <fcitx5>
    <fhs>
    <fonts>
    <network>
    <nixpkgs>
    <programs>
    <shell>
    <terminal>
    <virtualisation>
    { nixos.security.sudo.wheelNeedsPassword = false; }
  ];
}
