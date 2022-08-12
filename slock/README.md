# slock
============================
simple screen locker utility for X.

[slock](https://tools.suckless.org/slock/) 是 suckless 中一款极简的锁屏工具。

## 安装💻

输入如下命令进行安装：

```sh
sudo make clean install
```

将 `config.def.h` 文件中的如下内容更改为自己的用户名和用户组即可：

```c
static const char *user  = "tuilk";
static const char *group = "tuilk";
```

## 补丁🧩

- [foreground-and-background](https://tools.suckless.org/slock/patches/foreground-and-background/): 
结合了 blur-pixelated-screen 和 dwmlogo 的特性。它将 slock 的背景更改为当前桌面的模糊版本，将 slock 的
前景更改为根据状态颜色所改变的 dwm 图标 [20210611-35633d4]
- [capscolor](https://tools.suckless.org/slock/patches/capscolor/): 引入另一种颜色来显示大写状态 [20170106-2d2a21a]

## 使用🔨

在 shell 中输入 `slock` 即可锁屏。

如果要解锁，只需直接输入密码即可。输入状态默认为蓝色，如果密码错误则显示为红色。

## 自定义🙂

如果要修改默认配置，例如状态颜色、图标大小、图标样式等，只需修改 `config.def.h` 文件即可而非 `config.h` 文件。

如果需要添加其他补丁，可以使用 `wget` 下载 diff 文件到 `patches` 文件夹，然后输入如下命令添加补丁：

```sh
patch -p1 < patches/slock-xxx.diff
```

其他补丁见 [suckless](https://tools.suckless.org/slock/patches/)
