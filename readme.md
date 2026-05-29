# 基本信息
这是我的 NixOS 个人配置仓库。

此配置使用 Niri (Noctalia) + KDE Plasma 桌面环境，软件源主要使用`unstable`分支，也有最新的`stable`分支以及`nixpkgs-unstable`分支可选。

此配置为自用，或许可以面向没有开发工作并且轻度使用电脑的桌面端用户。采用[`Dendritic Pattern`](https://github.com/mightyiam/dendritic).

状态：维护中

`assets`文件夹下包含了[遍黑体](https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic_Project)、[壁纸](https://www.pixiv.net/artworks/121023003)与自制 NixOS Logo.

**在我的电脑上的已知问题：在静音模式下注销，重新登录之后静音可能会自动解除。**


## [NixOS 安装指南](https://github.com/Waroku06/nixos-config/wiki/NixOS-%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97)

# Niri 快捷键
## 基础操作
| 快捷键                             | 动作           |
| ------------------------------- | ------------ |
| `Mod`(`窗户`) + `Return`(`Enter`) | 打开终端 (kitty) |
| `Mod` + `S`                     | 打开应用启动器 |
| `Mod` + `Q`                     | 关闭窗口         |
| `Mod` + `F`                     | 最大化当前列宽度     |
| `Mod` + `G`                     | 全屏当前窗口       |
| `Mod` + `Shift` + `F`           | 切换窗口浮动       |
| `Mod` + `C`                     | 居中当前列        |
## 移动窗口
| 快捷键                    | 动作   |
| ---------------------- | ---- |
| `Mod` + `H` / `←`      | 左移   |
| `Mod` + `L` / `→`      | 右移   |
| `Mod` + `K` / `↑`      | 上移   |
| `Mod` + `J` / `↓`      | 下移   |
| `Mod` + 滚轮上/下          | 左/右移 |
| `Mod` + `Ctrl` + 滚轮上/下 | 移动至上/下一桌面 |
## 改变窗口位置
| 快捷键                   | 动作           |
| --------------------- | ------------ |
| `Mod` + `Shift` + `H` | 和左边换位置       |
| `Mod` + `Shift` + `L` | 和右边换位置       |
| `Mod` + `Shift` + `K` | 和上边换位置       |
| `Mod` + `Shift` + `J` | 和下边换位置       |
| `Mod` + `,`           | 从右侧列吸一个窗口到底部 |
| `Mod` + `.`           | 将底部窗口弹出到右侧新列 |
## 尺寸调整
| 快捷键                  | 动作        |
| -------------------- | --------- |
| `Mod` + `Ctrl` + `H` | 列宽减小 5%   |
| `Mod` + `Ctrl` + `L` | 列宽增加 5%   |
| `Mod` + `Ctrl` + `K` | 窗口高度增加 5% |
| `Mod` + `Ctrl` + `J` | 窗口高度减小 5% |
## 音频控制
| 快捷键                               | 动作     |
| --------------------------------- | ------ |
| `XF86AudioRaiseVolume`(`Fn`+`F3`) | 音量 +5% |
| `XF86AudioLowerVolume`(`Fn`+`F2`) | 音量 -5% |
| `XF86AudioMute`(`Fn`+`F1`)        | 静音开关   |
## 截图
| 快捷键              | 动作   |
| ---------------- | ---- |
| `Print`          | 截图   |
| `Ctrl` + `Print` | 全屏截图 |
| `Alt` + `Print`  | 窗口截图 |

# (自用) 一些手动设置
以下是我懒得写、或者我不会写的配置，以及某些应用的手动配置，需要手动操作：

1. 启用中文、日文输入法：进入 Plasma 桌面，进入设置-键盘-虚拟键盘，应用 Fcitx5 Wayland 启动器；再进入输入法，点击右下角添加输入法，取消仅显示当前语言，添加中州韵和 Mozc，删除“拼音”，然后点击配置附加组件，经典用户界面，把主题和深色主题都改为“KDE Plasma (实验性)”。输入时把中州韵切换成**朙月拼音·简化字**模式。
2. 打开 OBS Studio，设置**原生分辨率**而不是 1080P. 在 设置/输出 先把简单改为**高级**，然后在录制那一栏把编码器改为 **x264**。
3. 配置 Wine：确认自己的代理可用，然后打开终端，输入 winetricks，在里面安装 cjkfonts。进入 winecfg，在函数库那一栏的新增函数库顶替里输入 ddraw，点击添加，确保是原装先于内建。
4. Prism Launcher 里的设置，勾选启用什么什么 GameMode，如果有独显也勾上独显。

# 参考资料
[Vimjoyer, Ultimate NixOS Desktop: Niri, Noctalia Shell, and the Dendritic Pattern | Full Setup](https://www.youtube.com/watch?v=aNgujRXDTdE)

[Youthdreamer/nixos-config](https://github.com/Youthdreamer/nixos-config)

[HPCesia/nix-config](https://repo.hpcesia.com/HPCesia/nix-config)

[Ryan Yin, NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/zh/)

[知狐，NixOS 安装 Rime 输入法](https://zhuanlan.zhihu.com/p/1963358188226183647)