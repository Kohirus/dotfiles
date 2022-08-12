# dwm

[dwm](https://dwm.suckless.org/) 是一个动态窗口管理器。其内置有三种布局形式：平铺布局(tile)、
浮动布局(floating)、单片布局(monocle)。所有的布局都可以动态应用，以优化正在使用的应用程序和
执行任务的环境。

![screenshot](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_dwm_slstatus.png)

## 依赖📦️

- xorg-xinit: 命令行启动 xorg
- feh: 设置壁纸
- picom: 动画、模糊、圆角效果
- acpi: 获取笔记本电池电量
- amixer: 获取声音信息
- Nerd Font: 图形字体

## 安装💿

输入如下命令进行安装:

```sh
sudo make clean install
```

然后将 [config.def.h](https://github.com/tuilk/dotfiles/blob/main/dwm/config.def.h#L94-L98) 文件中的路径更改为你自己的路径。

## 补丁🧩

- [autostart](https://dwm.suckless.org/patches/autostart/): 启动 dwm 后自定启动自定义脚本 [20161205-bb3bd6f]
- [fancybar](https://github.com/bakkeby/patches/blob/master/dwm/dwm-fancybar-6.3.diff): 
显示所有可见窗口的名称而非当前窗口 [6.3]
- [fullgaps-toggle](https://dwm.suckless.org/patches/fullgaps/): 更改窗口之间的间隙 [20200830]
- [fullscreen](https://dwm.suckless.org/patches/fullscreen/): 完全全屏 [6.2]
- [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/): 隐藏未使用的标签 [6.3]
- [pertag-perseltag](https://dwm.suckless.org/patches/pertag/): 为每个标签保存自己的布局 [6.2]
- [restartsig](https://dwm.suckless.org/patches/restartsig/): 快速加载 dwm 的配置而无需重启 [20180523-6.2]
- [rotatestack](https://github.com/bakkeby/patches/blob/master/dwm/dwm-rotatestack-6.3.diff)
: 旋转堆栈区 [6.3]
- [scratchpad](https://dwm.suckless.org/patches/scratchpad/): 生成一个临时的终端窗口 [6.2]
- [status2d-systray](https://dwm.suckless.org/patches/status2d/): 自定义颜色和图形，同时嵌入系统托盘 [6.3]
- [viewontag](https://dwm.suckless.org/patches/viewontag/): 当移动当前窗口到另一个标签时跟随光标 [20210312-61bb8b2]
- [underlinetags](https://dwm.suckless.org/patches/underlinetags/dwm-underlinetags-6.2.diff): 当前标签页的下划线 [6.2]
- [rainbowtags](https://dwm.suckless.org/patches/rainbowtags/): 为每个标签页设定不同的颜色 [6.2]
- [barpadding](https://dwm.suckless.org/patches/barpadding/): 为状态栏添加水平间隙和垂直间隙 [20211020-a786211]
- [statuspadding](https://dwm.suckless.org/patches/statuspadding/): 为状态栏添加水平填充和垂直填充 [6.3]

## 快捷键⌨️

我的 `MODKEY` 为 `Win` 键.

| 快捷键                      | 描述                                    |
| --------------------------- | --------------------------------------- |
| `MODKEY + p`                | 打开 dmenu                              |
| `MODKEY + ~`                | 打开临时的浮动终端窗口                  |
| `MODKEY + Shift + Enter`    | 打开默认的终端                          |
| `MODKEY + b`                | 显示/隐藏状态栏                         |
| `MODKEY + j/k`              | 切换光标到另一个窗口                    |
| `MODKEY + Shift + j/k`      | 切换堆栈区                              |
| `MODKEY + h/l`              | 调整堆栈区的大小                        |
| `MODKEY + Shift + c`        | 关闭当前窗口                            |
| `MODKEY + t`                | 切换到平铺布局模式                      |
| `MODKEY + f`                | 切换到浮动布局模式                      |
| `MODKEY + Shift + f`        | 切换到全屏布局模式                      |
| `MODKEY + Space`            | 在平铺模式和浮动模式之间切换            |
| `MODKEY + Shift + Space`    | 将当前窗口切换为浮动模式                |
| `MODKEY + Tab`              | 切换到下一个标签页                      |
| `MODKEY + <Number>`         | 切换到指定的标签页                      |
| `MODKEY + Shift + <Number>` | 将当前窗口移动到指定的标签页            |
| `MODKEY + Shift + q`        | 退出 dwm                                |
| `MODKEY + Shift + Ctrl + q` | 重新加载 dwm 配置文件                   |
| `MODKEY + +/-`              | 增大/缩小窗口间的间隙                   |
| `MODKET + Shift + -`        | 还原到默认的窗口间隙                    |
| `MODKEY + Shift + =`        | 打开/关闭窗口间隙功能                   |
| `MODKEY + Left Mouse Btn`   | 移动窗口                                |
| `MODKEY + Right Mouse Btn`  | 调整窗口大小                            |
| `MODKEY + F1`               | 静音                                    |
| `MODKEY + F2`               | 减小音量                                |
| `MODKEY + F3`               | 增大音量                                |
| `MODKEY + w`                | 切换壁纸                                |
| `MODKEY + x`                | 打开电源菜单                            |

## 自定义配置💡

如果想修改默认的快捷键、字体、颜色等配置，只需要修改 `config.def.h` 文件即可，而非 `config.h` 文件。

如果想添加其他的壁纸，可以使用 `wget` 将补丁下载到 `patches` 文件夹中，然后在 dwm 目录
中输入如下命令以添加补丁：

```sh
patch -p1 < patches/dwm-xxxx.diff
```

可以在如下网站中找寻你所需要的补丁：

- [suckless - dwm](https://dwm.suckless.org/)
- [github](https://github.com/bakkeby/patches)

## Suckless📦

我的其他关于 suckless 的仓库如下：

- [st](https://github.com/tuilk/st)
- [slstatus](https://github.com/tuilk/slstatus)
- [dmenu](https://github.com/tuilk/dmenu)
