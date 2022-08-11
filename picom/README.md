# picom

[picom](https://github.com/yshui/picom) 是 X 的合成器，可以为窗口管理器提供动画、
圆角、模糊、窗口阴影等效果。

## 安装💻

输入如下命令中任意一个安装 picom：

```sh
yay -S picom-git
paru picom-git
```

## 运行🎬

将如下内容添加到 `.xinitrc` 文件中以在启动窗口管理器之前启动 picom：

```sh
picom --experimental-backends -b
```

其中 `-b` 选项表示在后台运行，`--experimental-backends` 表示开启实验性功能。

`picom.conf.example` 包含所有的 picom 配置示例
