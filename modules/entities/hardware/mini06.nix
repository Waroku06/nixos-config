{ __findFile, ... }: {
  den.aspects.mini06.nixos = {
#     boot.loader.grub.enable = false;
  };
  den.aspects.mini06.includes = [ (<impermanent> "/dev/disk/by-id/nvme-UMIS_RPJYJ512MKN1QWY_SS1K16471Z2CD3AY2373" 2) ];
}
