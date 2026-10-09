# DO-NOT-EDIT. This file was auto-generated using github:denful/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  nixConfig = {
    accept-flake-config = true;
    auto-optimise-store = true;
    extra-substituters = [
      "https://prismlauncher.cachix.org"
      "https://ryoppippi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
      "ryoppippi.cachix.org-1:b2LbtWNvJeL/qb1B6TYOMK+apaCps4SCbzlPRfSQIms="
    ];
    lazy-trees = true;
    use-xdg-base-directories = true;
  };

  inputs = {
    codex-cli-nix.url = "github:sadjow/codex-cli-nix";
    codex-desktop-linux = {
      url = "github:ilysenko/codex-desktop-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    den.url = "github:denful/den";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    linuxqq-wayland-fix.url = "github:SHORiN-KiWATA/linuxqq-wayland-fix";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nix-claude-code.url = "github:ryoppippi/nix-claude-code";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    nixpkgs-pkun.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plangothicP1 = {
      url = "file+https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic_Project/releases/download/V2.9.5795/PlangothicP1-Regular.ttf";
      flake = false;
    };
    plangothicP2 = {
      url = "file+https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic_Project/releases/download/V2.9.5795/PlangothicP2-Regular.ttf";
      flake = false;
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
    preservation.url = "github:nix-community/preservation";
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
    xiongchenyu6.url = "github:xiongchenyu6/nur-packages";
    xp3-brute.url = "github:Waroku06/xp3-brute";
  };
}
