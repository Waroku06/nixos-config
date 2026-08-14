{
  inputs,
  ...
}:
let
  pc =
    { t, s }:
    import t {
      system = s;
      config.allowUnfree = true;
    };
  mkpk = s: {
    pkgs-stable = pc {
      t = inputs.nixpkgs-stable;
      inherit s;
    };
    pkgs-pkun = pc {
      t = inputs.nixpkgs-pkun;
      inherit s;
    };
    pkgs-small = pc {
      t = inputs.nixpkgs-small;
      inherit s;
    };
  };
in
{
  flake-file.inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-pkun.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  den.aspects.nixpkgs.nixos = { host, ... }: {
    nix.settings = {
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
      auto-optimise-store = true;
    };
    nixpkgs.overlays = [
      inputs.nur.overlays.default
    ];
    nixpkgs.config.allowUnfree = true;
    _module.args = mkpk host.system;
  };
  den.aspects.nixpkgs.homeManager = { pkgs, ... }: {
    nixpkgs.overlays = [
      inputs.nur.overlays.default
    ];
    nixpkgs.config.allowUnfree = true;
    _module.args = mkpk pkgs.stdenv.hostPlatform.system;
  };
  perSystem =
    { system, ... }:
    {
      _module.args = mkpk system;
    };
}
