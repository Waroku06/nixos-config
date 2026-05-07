{ self, inputs, ... }:
{
  flake.homeModules.fastfetch = _: {
    programs.fastfetch = {
      enable = true;

      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

        logo = {
          type = "kitty";
          source = "${self}/assets/img/logo.png";
          width = 36;
        };

        display = {
          separator = " ";
        };

        modules = [
          {
            type = "title";
            key = "╭─";
            format = "{user-name}@{host-name}";
            keyColor = "blue";
          }
          {
            type = "os";
            key = "├─";
            keyColor = "blue";
          }
          {
            type = "kernel";
            key = "├─";
            keyColor = "blue";
          }
          {
            type = "bios";
            key = "├─󰖡";
            keyColor = "blue";
          }
          {
            type = "packages";
            key = "├─󰏖";
            keyColor = "blue";
          }
          {
            type = "uptime";
            key = "├─󰅐";
            keyColor = "blue";
          }
          {
            type = "command";
            key = "├─󰇄";
            keyColor = "blue";
            text = ''bash -lc 'birth_install=$(stat -c %W /); if [ "$birth_install" -gt 0 ]; then current=$(date +%s); echo "$(( (current - birth_install) / 86400 )) days"; else echo "N/A"; fi' '';
          }
          {
            type = "datetime";
            key = "╰─";
            keyColor = "blue";
          }
          "break"

          {
            type = "shell";
            key = "╭─";
            keyColor = "yellow";
          }
          {
            type = "terminal";
            key = "├─";
            keyColor = "yellow";
          }
          {
            type = "terminalfont";
            key = "├─";
            keyColor = "yellow";
          }
          {
            type = "lm";
            key = "├─󰧨";
            keyColor = "yellow";
          }
          {
            type = "de";
            key = "├─";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = "├─";
            keyColor = "yellow";
          }
          {
            type = "wmtheme";
            key = "├─󰉦";
            keyColor = "yellow";
          }
          {
            type = "locale";
            key = "╰─";
            keyColor = "yellow";
          }
          "break"

          {
            type = "host";
            key = "╭─󰌢";
            keyColor = "green";
          }
          {
            type = "cpu";
            key = "├─󰻠";
            format = "{1} @{7}";
            keyColor = "green";
          }
          {
            type = "gpu";
            key = "├─󰍛";
            format = "{1} {2} {3}";
            keyColor = "green";
          }
          {
            type = "memory";
            key = "├─󰑭";
            keyColor = "green";
          }
          {
            type = "swap";
            key = "├─󰓡";
            keyColor = "green";
          }
          {
            type = "disk";
            key = "├─";
            keyColor = "green";
          }
          {
            type = "display";
            key = "├─󰍹";
            format = "{1}x{2} @{3}Hz {6}";
            keyColor = "green";
          }
          {
            type = "localip";
            key = "├─󰩟";
            compact = true;
            keyColor = "green";
          }
          {
            type = "sound";
            key = "╰─";
            keyColor = "green";
          }
          {
            type = "colors";
            paddingLeft = 10;
            symbol = "circle";
          }
        ];
      };
    };
  };
}