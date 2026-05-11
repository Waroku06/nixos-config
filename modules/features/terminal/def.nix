{ self, inputs, ... }:
{
  flake.nixosModules.terminal =
    { ... }:
    {
      imports = with self.nixosModules; [
        # konsole # 这个模块是禁用 Konsole 的
        kitty
      ];
    };
  flake.homeModules.terminal =
    { ... }:
    {
      imports = with self.homeModules; [
        kitty
        konsole
      ];
    };
}
