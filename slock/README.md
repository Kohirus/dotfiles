# slock

[slock](https://tools.suckless.org/slock/) 是 suckless 中的一个极简的锁屏工具。

## 安装

打开 `config.def.h` 文件，将如下代码中的用户名和群组名更改为自己的：

```c
static const char *user  = "tuilk";
static const char *group = "tuilk";
```

输入如下命令进行安装：

```sh
sudo make clean install
```

## 补丁

- [foreground-and-background](https://tools.suckless.org/slock/patches/foreground-and-background/): 
该补丁结合了 blur-pixelated-screen 和 dwmlogo 的特性。它将 slock 的背景更改为当前桌面的模糊版本，将 
slock 的前景更改为根据当前状态颜色所变化的 dwm 图标 [20210611-3533d4]
- [capscolor](https://tools.suckless.org/slock/patches/capscolor/): 引入另一种颜色以指示大写状态 [20170106-2d2a21a]

## 使用

在 shell 中输入 `slock` 即可锁屏。

如果要解锁，直接输入用户密码，然后按下回车即可解锁。

输入状态默认为蓝色，输入错误会显示为红色，大写状态则为橙色。

## 自定义

如果需要修改默认的配置，例如颜色、图标大小、模糊度、图标样式等，只需修改 `config.def.h` 文件
即可而非 `config.h` 文件。

如果需要添加其他的补丁，只需要使用 `wget` 下载 diff 文件到 `patches` 文件夹下即可，然后输入如下
命令添加补丁：

```sh
patch -p1 patches/slock-xxx.diff
```

其他的补丁可以去参阅 [suckless](https://tools.suckless.org/slock/patches/)
