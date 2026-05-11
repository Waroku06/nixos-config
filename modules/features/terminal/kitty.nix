{ self, inputs, ... }:
{
  flake.nixosModules.kitty =
    { pkgs, lib, ... }:
    {
      environment.sessionVariables = {
        TERMINAL = "kitty";
      };
    };
  flake.homeModules.kitty =
    { pkgs, lib, ... }:
    {
      programs.kitty = {
        enable = true;
        settings = {
          enable_audio_bell = "no";

          font_size = 13;

          cursor_text_color = "background";

          allow_remote_control = "yes";
          shell_integration = "enabled";

          cursor_trail = 3;

          background = "#303446";
          background_opacity = 0.9;
          foreground = "#c6d0f5";

          color0 = "#737994";
          color1 = "#e78284";
          color2 = "#a6d189";
          color3 = "#e5c890";
          color4 = "#8caaee";
          color5 = "#ca9ee6";
          color6 = "#99d1db";
          color7 = "#c6d0f5";
          color8 = "#737994";
          color9 = "#e78284";
          color10 = "#a6d189";
          color11 = "#e5c890";
          color12 = "#8caaee";
          color13 = "#ca9ee6";
          color14 = "#99d1db";
          color15 = "#c6d0f5";
          cursor = "#c6d0f5";
          selection_foreground = "#303446";
          selection_background = "#c6d0f5";
        };
      };
    };
}
