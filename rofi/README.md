# rofi

[rofi](https://github.com/davatorium/rofi) 是一个程序启动器。和 dmenu 一样，为用户提供一个文本选项
列表，其中可以选择一个或多个选项。它可以运行应用程序、选择窗口或者运行外部脚本等。

![screenshot](https://raw.githubusercontent.com/tuilk/Image/main/rofi.png)

## 安装💻

输入如下命令安装 rofi 和扁平化图标:

```sh
sudo pacman -S rofi
sudo pacman -S papirus-icon-theme
```

## 命令📞

rofi 可以使用如下命令：

```sh
rofi			# 显示当前开启的模式和未开启的模式
rofi-theme-selector	# 更改 rofi 的内置主题
rofi -dump-config	# 查看 rofi 的配置选项
rofi -show drun		# 显示可运行的桌面应用程序列表
rofi -show window	# 显示当前窗口列表
rofi -show run		# 显示所有可运行程序列表
```

## 快捷键⌨️

| 快捷键             | 说明                        |
| ------------------ | --------------------------- |
| `Ctrl + v`         | 粘贴                        |
| `Ctrl + a/e`       | 移到 行首/行尾              |
| `Alt + b/f`        | 前/后 移一个单词            |
| `Ctrl + Alt + h/d` | 删除 前/后 一个单词         |
| `Ctrl + u/k`       | 删除到 行首/行尾            |
| `Enter`            | 选择当前选项                |
| `Ctrl + Tab`       | 切换到下一个模式            |
| `Page Up/Down`     | 转到 上/下 一页             |
| `Home/End`         | 跳转到 第一个/最后一个 条目 |
| `~`                | 切换大小敏感                |
| `Alt + ~`          | 切换排序                    |
| `Esc`              | 退出 rofi                   |
