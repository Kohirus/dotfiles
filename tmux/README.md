# tmux

[tmux](https://github.com/tmux/tmux) 是一个终端复用器(terminal multiplexer)。

## 安装💻

输入如下命令安装 tmux:

```sh
sudo pacman -S tmux
```

[tpm](https://github.com/tmux-plugins/tpm) 是一款 tmux 的插件管理器，输入如下命令进行安装:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## 加载配置⚙️

输入 `tmux` 进入 tmux，然后输入如下命令加载配置：

```sh
tmux source ~/.tmux.conf
```

完成之后，按下 `<Ctrl+a> + I` 安装相关插件。

此处只安装了 [Dracula](https://draculatheme.com/tmux) 主题，配置方法见官网文档。
