# Alacritty

[Alacritty](https://github.com/alacritty/alacritty) 是一个跨平台、GPU 增强的终端模拟器。
可以简单地实现在其他模拟器中不可能实现的优化。

## 使用💻

首先需要安装 JetBrains Nerd Font 字体。

然后输入如下命令安装即可：

```sh
sudo pacman -S alacritty
```

## 主题👕

常见的主题可以在 [Alacritty Theme](https://github.com/eendroroy/alacritty-theme) 中寻找。

如下为推荐主题：

- tokyo-night
- tokyo-night-storm
- thelovelace
- taerminal
- snazzy
- omni
- monokai_pro
- dracula
- palenight (目前所使用的主题)
- nord
- moonlight_ii_vscode

将配色复制到 `alacritty.yml` 文件中即可。

此外，也可以使用 [alacritty-colorscheme](https://github.com/toggle-corp/alacritty-colorscheme) 
来快速切换主题。(可以通过 aur 或者 pip 进行下载)。

下载完成后将其添加到环境变量即可，配置方法见 [doc](https://github.com/toggle-corp/alacritty-colorscheme/blob/master/README.md)，
其用法如下：

```sh
# 列出可选主题
alacritty-colorscheme -V list
# 查看当前主题
alacritty-colorscheme -V status
# 使用指定主题
alacritty-colorscheme -V apply <theme-name>
```
