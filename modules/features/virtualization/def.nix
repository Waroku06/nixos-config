{ self, inputs, ... }:
{
  flake.nixosModules.virtualization =
    { pkgs, ... }:
    {
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;
      users.users.waroku06.extraGroups = [ "libvirtd" ];
      # Networking
      environment.systemPackages = with pkgs; [
        dnsmasq
      ];
      networking.firewall.trustedInterfaces = [ "virbr0" ];
      # Shared folders
      virtualisation.libvirtd.qemu.vhostUserPackages = with pkgs; [
        virtiofsd
      ];
    };
}
