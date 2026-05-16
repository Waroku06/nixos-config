{ self, inputs, ... }:
{
  flake.nixosModules.proxy =
    { ... }:
    {
      # 系统级代理设置 TODO 调整成你的代理端口
      networking.proxy = {
        default = "http://127.0.0.1:7890";
        httpProxy = "http://127.0.0.1:7890";
        httpsProxy = "http://127.0.0.1:7890";
        noProxy = "localhost,127.0.0.1,::1,*.local";
      };
    };
}
