# slstatus

[slstatus](https://tools.suckless.org/slstatus/) 是 suckless 中的状态栏工具.

![screenshot](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_dwm_slstatus.png)

## 安装💿

输入如下命令进行安装：

```sh
sudo make clean install
```

然后将如下内容添加到 `.xinitrc` 文件中：

```sh
slstatus &
```

## 细节📄

它将展示如下信息：

- 内核版本
- CPU 的使用百分比
- 内存百分比
- 音量百分比
- 电池百分比
- 日期、时间

## Customize💡

如果需要修改默认配置，只需要修改 `config.def.h` 文件即可，而非 `config.h` 文件。
