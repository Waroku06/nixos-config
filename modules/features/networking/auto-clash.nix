{ self, inputs, ... }:
{
  flake.nixosModules.auto-clash =
    { ... }:
    {
      preservation.preserveAt."/persistent".users.waroku06.directories = [
        "clash"
      ];
    };

  flake.homeModules.auto-clash =
    { pkgs, ... }:
    {
      # 开机自动启动 Clash 代理 TODO 根据需要自行调整命令
      systemd.user.services.auto-cl = {
        Unit = {
          Description = "Auto run cl command on startup";
          After = [ "network-online.target" ];
          Wants = [ "network-online.target" ];
        };
        Service = {
          ExecStart = "${pkgs.fish}/bin/fish -c '/home/waroku06/clash/clash -d /home/waroku06/clash/'";
          Restart = "on-failure";
          RestartSec = "5s";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    };
}
