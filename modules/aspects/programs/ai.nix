{ inputs, ... }: {
  flake-file = {
    inputs = {
      codex-cli-nix = {
        url = "github:sadjow/codex-cli-nix";
      };
      codex-desktop-linux = {
        url = "github:ilysenko/codex-desktop-linux";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      xiongchenyu6.url = "github:xiongchenyu6/nur-packages";
      nix-claude-code.url = "github:ryoppippi/nix-claude-code";
    };
    nixConfig = {
      extra-substituters = [ "https://ryoppippi.cachix.org" ];
      extra-trusted-public-keys = [
        "ryoppippi.cachix.org-1:b2LbtWNvJeL/qb1B6TYOMK+apaCps4SCbzlPRfSQIms="
      ];
    };
  };
  den.ful.programs.ai.homeManager = { pkgs, ... }: {
    imports = [ inputs.codex-desktop-linux.homeManagerModules.default ];
    programs.codexDesktopLinux = {
      enable = true;
      computerUseUi.enable = true;
      linuxFeatures = [ "ui-tweaks" ];
    };
    nixpkgs.overlays = [ inputs.nix-claude-code.overlays.default ];
    home.packages = [
      inputs.xiongchenyu6.packages.${pkgs.stdenv.hostPlatform.system}.cc-switch
      inputs.codex-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.claude-code
    ];
  };
}
