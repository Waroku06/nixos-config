{ inputs, ... }: {
  # 不要设置 rikka.inputs.nixpkgs.follows，否则 Rikka 预编译的二进制会被重新链接而损坏
  flake-file.inputs.rikka.url = "github:project-rikka/packages";

  # Rikka Wayland 合成器 / 桌面
  # 登录方式：沿用 plasma-login-manager，在登录界面选择 Rikka 会话（因此不设置 rikka.autologin.user）
  # NOTE 本配置仍在测试中
  den.ful.gui.rikka = { user, ... }: {
    nixos = {
      imports = [
        inputs.rikka.nixosModules.default
        # Rikka 的 Settings 与 Packages 应用会写入这个目录
        # 目录名以 _ 开头，import-tree 不会把它当作 flake-parts 模块导入
        ./_rikka
      ];
      rikka = {
        enable = true;
        # 配置仓库不在 /etc/nixos，需指明 flake 与 rikka 目录的位置（必须是绝对路径）
        configuration = {
          flake = "/home/${user.name}/nixos-config";
          modules = "/home/${user.name}/nixos-config/modules/aspects/gui/_rikka";
        };
      };
      # Rikka 自己启动 fcitx5，禁用 XDG autostart 避免启动两次
      # （Plasma 下 fcitx5 由 kwinrc 的 InputMethod 启动，不受影响）
      systemd.user.units."app-org.fcitx.Fcitx5@autostart.service".enable = false;
    };
  };
}
