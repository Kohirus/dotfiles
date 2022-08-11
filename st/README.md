# st

[st](https://st.suckless.org/) 是 suckless 中的一个极简终端.

![screenshot](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_dwm_slstatus.png)

## 安装💿

输入如下命令进行安装

```sh
sudo make clean install
```

## 补丁🧩

- [anysize](https://st.suckless.org/patches/anysize/): 允许 st 修改像素大小 [20220718-baa9357]
- [blinking cursor](https://st.suckless.org/patches/blinking_cursor/): 闪烁光标 [20211116-2f63597]
- [dracula](https://st.suckless.org/patches/dracula/): dracule 主题 [0.8.5]
- [hidecursor](https://st.suckless.org/patches/hidecursor/): 当输入时隐藏光标 [0.8.3]
- [scrollback](https://st.suckless.org/patches/scrollback/): 允许终端滚动 [20210507-4536f46]
- [scrollback-mouse-altscreen](https://st.suckless.org/patches/scrollback/): 允许鼠标滚动终端 [20220127-2c5edf2] 
- [font2](https://st.suckless.org/patches/font2/): 允许添加额外的修补字体 [0.8.5]

## 快捷键⌨️

我的 `MODKEY` 是 `Win` 键.

可以按下 `MODKEY + u` 向上翻页，按下 `MODKEY + d` 向下翻页。

除此之外，还可以通过鼠标滚轮来滚动终端。

## 自定义💡

如果需要修改默认的配置，只需要修改 `config.def.h` 文件而非 `config.h` 文件。

如果需要添加其他的补丁，可以使用 `wget` 下载 diff 文件到 `patches` 文件夹中，然后通过如下命令添加补丁：

```sh
patch -p1 < patches/st-xxx.diff
```

可以在如下的网站中找到其他的补丁：

- [suckless - st](https://st.suckless.org/)
- [github](https://github.com/bakkeby/patches)
