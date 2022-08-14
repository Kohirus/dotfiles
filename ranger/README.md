# ranger

[ranger](https://github.com/ranger/ranger) 是一个带有 vim 键位绑定的控制台文件管理器。

## 安装💻

输入如下命令进行安装：

```sh
sudo pacman -S ranger
```

然后通过 pip 安装 [ueberzug](https://github.com/seebye/ueberzug) 以浏览图片：

```sh
pip install ueberzug
```

安装 `highlight` 以高亮预览文件。

## 插件🧩

首先，你需要安装 Nerd Font 以显示图标字体。

然后安装 [ranger_devicons](https://github.com/alexanderjeurissen/ranger_devicons) 插件以显示文件图标：

```sh
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
```

## 说明📑

各个文件的说明如下：

```sh
rc.conf     - 选项设置和快捷键
commands.py - 能通过 : 执行的命令
rifle.conf  - 指定不同类型的文件的默认打开程序。
scope.sh    - 用于指定预览程序的文件
```

## 快捷键⌨️

- `↑/↓ j/k`: 上下移动
- `←/h`: 返回父目录
- `→/l`: 进入选定目录或者打开文件
- `i`: 全屏显示当前文件的预览
- `yy`: 复制文件
- `pp`: 粘贴文件
- `dd`: 剪切文件
- `q`: 退出预览或者退出 ranger 
- `:`: 手动输入相关命令
- `g`: 导航和标签
- `u/d`: 上下翻半页
- `b/f`: 上下翻页
- `r`: 使用自定义工具打开当前文件
- `R`: 刷新目录
- `o`: 排序
- `.`: 过滤器堆栈
- `u`: 撤销
- `z`: 更改设置
- `Backspace`: 显示隐藏文件
- `M`: 创建文件夹并进入
- `Alt + /`: 查找文件/文件夹
- `Alt + n`: 下一个匹配项
- `Alt + p`: 上一个匹配项
- `+/-`: 更改文件权限
- `cw`: 重命名
- `space`: 选择文件
- `bulkrename`: 批量重命名

## 快速启动🎬

如果需要快速启动 ranger，可以将如下内容添加到 shell 配置文件中，例如 `.zshrc`:

```sh
echo "alias ra=ranger" >> ~/.zshrc
echo "alias rcd='ranger --choosedir=\$HOME/.rangerdir; LASTDIR=\`cat \$HOME/.rangerdir\`; cd \"\$LASTDIR\"'" >> ~/.zshrc
```

其中，`ra` 是启动 ranger，而 `rcd` 则会在退出 ranger 时进入到退出前所浏览的目录中。
