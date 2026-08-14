{ inputs, ... }: {
  flake-file.inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  den.ful.hardware.intel.nixos = {
    imports = with inputs.nixos-hardware.nixosModules; [
      common-cpu-intel
      common-pc-laptop
      common-pc-laptop-ssd
    ];
    hardware = {
      enableAllFirmware = true;
      cpu.intel.updateMicrocode = true;
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
