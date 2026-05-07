{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.Noctalia06 = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings =
        (builtins.fromJSON
          (builtins.readFile ./noctalia.json));
    };
  };
}