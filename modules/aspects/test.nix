{ __findFile, ... }: {
    den.aspects.test = {
        includes = [ <nixpkgs> ];
        nixos.system.stateVersion = "26.05";
    };
#     den.default.includes = [ <den/hostname> ];
}
