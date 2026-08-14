{
  den.aspects.network = {
    nixos = {
      networking = {
        networkmanager.enable = true;
        proxy = {
          default = "http://127.0.0.1:7890";
          httpProxy = "http://127.0.0.1:7890";
          httpsProxy = "http://127.0.0.1:7890";
          allProxy = "socks5://127.0.0.1:7891";
          noProxy = "localhost,127.0.0.1,::1,*.local";
        };
      };
    };
    homeManager = { user, pkgs, ... }: {
      # 开机自动启动 Clash 代理 TODO 根据需要自行调整命令
      systemd.user.services.auto-cl = {
        Unit = {
          Description = "Auto run cl command on startup";
          After = [ "network-online.target" ];
          Wants = [ "network-online.target" ];
        };
        Service = {
          ExecStart = "${pkgs.bash}/bin/bash -c '/home/${user.name}/clash/clash -d /home/${user.name}/clash/'";
          Restart = "on-failure";
          RestartSec = "5s";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    };
  };
}
