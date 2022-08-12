# Dotfiles

## 工作流🚀

- 桌面管理器：ly
- 窗口管理器：dwm
- 程序启动器：rofi / dmenu
- 终端：alacritty / st
- 状态栏：slstatus
- 多路复用器：tmux
- 动画效果：picom
- 文本编辑器：neovim
- 文件管理器：ranger
- 任务管理器：htop
- shell：zsh
- Git管理：lazygit
- 快速查找：fd
- 文本过滤：ripgrep
- 锁屏工具：slock

## 使用方法🗝️

输入如下命令克隆仓库:

```sh
git clone https://github.com/tuilk/dotfiles.git ~/.dotfiles
```

然后在 `~/.config` 目录下创建所需要配置应用的软链接即可，例如 rofi:

```sh
ln -s ~/.dotfiles/rofi ~/.config/rofi
```
