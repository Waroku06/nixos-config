{
  # NOTE 计划换成别的虚拟机
  den.aspects.virtualisation.nixos.virtualisation.vmware.host.enable = false; # true;

  # Fix vmware ko.cer certificates https://github.com/NixOS/nixpkgs/issues/575192
  den.aspects.virtualisation.nixos.nixpkgs.overlays = [
    (final: prev: {
      linuxPackages_latest = prev.linuxPackages_latest.extend (
        lfinal: lprev: {
          vmware = lprev.vmware.overrideAttrs (old: {
            postInstall = (old.postInstall or "") + ''
              if [ -d "$out/lib/modules" ]; then
                find "$out/lib/modules" -name "*.ko" -print0 | while IFS= read -r -d "" ko; do
                  touch "$ko.cer"
                  touch "$(dirname "$ko")/$(basename "$ko" .ko).ko.cer"
                done
              fi
            '';
          });
        }
      );
    })
  ];
}
