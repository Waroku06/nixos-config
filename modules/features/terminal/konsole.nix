{ self, inputs, ... }:
{
  flake.nixosModules.konsole =
    { pkgs, ... }:
    {
      environment.plasma6.excludePackages = [ pkgs.kdePackages.konsole ];
    };
  flake.homeModules.konsole = _: {
    # Konsole 终端个性化配置
    # 1. 映射配色方案文件 (.colorscheme)
    # 这会自动生成在 ~/.local/share/konsole/Catppuccin-Frappe.colorscheme
    xdg.dataFile."konsole/Catppuccin-Frappe.colorscheme".text = ''
      [Background]
      Color=48,52,70

      [BackgroundFaint]
      Color=48,52,70

      [BackgroundIntense]
      Color=48,52,70

      [Color0]
      Color=115,121,148

      [Color0Faint]
      Color=115,121,148

      [Color0Intense]
      Color=115,121,148

      [Color1]
      Color=231,130,132

      [Color1Faint]
      Color=231,130,132

      [Color1Intense]
      Color=231,130,132

      [Color2]
      Color=166,209,137

      [Color2Faint]
      Color=166,209,137

      [Color2Intense]
      Color=166,209,137

      [Color3]
      Color=229,200,144

      [Color3Faint]
      Color=229,200,144

      [Color3Intense]
      Color=229,200,144

      [Color4]
      Color=140,170,238

      [Color4Faint]
      Color=140,170,238

      [Color4Intense]
      Color=140,170,238

      [Color5]
      Color=202,158,230

      [Color5Faint]
      Color=202,158,230

      [Color5Intense]
      Color=202,158,230

      [Color6]
      Color=153,209,219

      [Color6Faint]
      Color=153,209,219

      [Color6Intense]
      Color=153,209,219

      [Color7]
      Color=198,208,245

      [Color7Faint]
      Color=198,208,245

      [Color7Intense]
      Color=198,208,245

      [Foreground]
      Color=198,208,245

      [ForegroundFaint]
      Color=198,208,245

      [ForegroundIntense]
      Color=198,208,245

      [General]
      Anchor=0.5,0.5
      Blur=false
      ColorRandomization=false
      Description=Catppuccin Frappé
      FillStyle=Tile
      Opacity=0.9
      Wallpaper=
      WallpaperFlipType=NoFlip
      WallpaperOpacity=1
    '';
    # 2. 映射 Profile 文件 (.profile)
    # 这会自动生成在 ~/.local/share/konsole/waroku06.profile
    xdg.dataFile."konsole/waroku06.profile".text = ''
      [Appearance]
      ColorScheme=Catppuccin-Frappe
      Font=Monospace,13,-1,5,400,0,0,0,0,0,0,0,0,0,0,1

      [General]
      Name=waroku06
      Parent=FALLBACK/
    '';
    # 3. Konsole 默认使用这个 Profile
    programs.konsole = {
      enable = true;
      defaultProfile = "waroku06"; # 必须与上面 .profile 里的 Name 一致
    };
  };
}
