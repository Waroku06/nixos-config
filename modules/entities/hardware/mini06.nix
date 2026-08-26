{ __findFile, ... }: {
  den.aspects.mini06.nixos = {
      # boot.loader.grub.enable = false;

      # TODO 新设备注意把新的 hardware-configuration.nix 内容对应进来
      # TODO 如果你启用了 <impermanent>，请把 fileSystems 删去
  };
  den.aspects.mini06.includes = [ (<impermanent> "/dev/disk/by-id/nvme-UMIS_RPJYJ512MKN1QWY_SS1K16471Z2CD3AY2373" 2) ];
}
