# dmenu

[dmenu](https://tools.suckless.org/dmenu/) 是 suckless 中的一个极简的程序启动工具.

![screenshot](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_dmenu_new.png)

## 安装💿

输入如下命令进行安装：

```sh
sudo make clean install
```

## 补丁🧩

- [border](https://tools.suckless.org/dmenu/patches/border/): 为 dmenu 窗口添加边界 [4.9]
- [caseinsensitive](https://tools.suckless.org/dmenu/patches/case-insensitive/): 搜索时忽略大小写 [20200523-db6093f]
- [center](https://tools.suckless.org/dmenu/patches/center/): 使 dmenu 居中于屏幕中央 [20200111-8cd37e1]
- [linesbelowprompt-and-fullwidth](https://tools.suckless.org/dmenu/patches/lines-below-prompt/): 将 dmenu 更改为垂直菜单 [20211014]
- [numbers](https://tools.suckless.org/dmenu/patches/numbers/): 在右侧显示匹配数目 [20220512-28fb3e2]

## 自定义💡

如果需要修改默认配置，只需要修改 `config.def.h` 文件即可，而非 `config.h` 文件。

如果需要添加其它的补丁，可以通过 `wget` 下载 diff 文件到 `patches` 文件夹，然后输入如下命令即可：

```sh
patch -p1 < patches/dmenu-xxx.diff
```

可以在如下网站中找寻其他的补丁：

- [suckless - dmenu](https://tools.suckless.org/dmenu/patches/)
- [github](https://github.com/bakkeby/patches)
