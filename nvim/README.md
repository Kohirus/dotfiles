# Neovim

![startup](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_neovim_startup.png)

![neovim](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_neovim_new.png)

## 依赖🔨

- [Neovim](https://github.com/neovim/neovim) >= 0.7.0
- [fd](https://github.com/sharkdp/fd): 用于 [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [ripgrep](https://github.com/BurntSushi/ripgrep): 用于 [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Nerd Font](https://www.nerdfonts.com/): 用于图标字体
- unzip: 用于解压 [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) 数据
- wget: 用于下载 [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) 数据

## 注意⚠️

**格式化**

请参阅 [formatter](https://github.com/mhartington/formatter.nvim) 选择自己需要的格式化程序。

然后启动 Neovim，输入 `:Mason` 打开安装界面，按下数字 5 跳转到格式化程序页面，选择自己需要的格式化
程序然后按下 `i` 键进行安装即可。之后，打开 `~/.config/nvim/lua/conf` 目录下的 `formatter.lua` 文
件，在其中添加自己需要的格式化选项。

在这个库中，我使用如下格式化程序：

- stylua: 格式化 Lua
- clang-foramt: 格式化 C/C++

> 如果需要在保存文件时自动格式化，只需要取消 [autocmd](https://github.com/tuilk/Neovim/blob/main/lua/core/autocmd.lua#L56-L61) 中的注释

**LSP**

你需要参阅 [lsp server](https://github.com/williamboman/nvim-lsp-installer#available-lsps) 和
[default_configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
为你的语言选择合适的服务器和基本配置。

然后打开 `~/.config/nvim/lua/conf` 路径下的 `others.lua` 文件，找到 `mason_lspconfig()` 函数，
在 `ensure_installed` 选项中添加自己需要的语言服务器，之后在启动 Neovim 后会自动安装。

然后打开 `lsp_config.lua` 文件，在文件末尾添加该语言服务器的相关配置选项。 

在这个库中，我使用了如下 lsp 服务器：

- stylua: 用于 Lua 语言
- clangd: 用于 C/C++ 语言
- cmake: 用于 Cmake 语言

可以输入如下命令安装/卸载 LSP 服务器：

- `:LspInstall [<server>...]`：安装服务器
- `:LspUninstall <server> ...`：卸载服务器

**调试**

你需要参阅 [nvim-dap](https://github.com/mfussenegger/nvim-dap) 和
[mason-nvim-dap](https://github.com/jayp0521/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua) 
选择所需要的 dap 服务器。

然后打开 `~/.config/nvim/lua/conf` 路径下的 `others.lua` 文件，找到 `mason_dap()` 函数,
修改其中的 `ensure_installed` 选项为自己所需要的 dap 服务器，在启动 Neovim 后会自动安装。

在这个库中，我使用了如下 dap 服务器：

- cpptools: 用于 C/C++ 语言

可以输入如下命令安装/卸载 DAP 服务器：

- `:DapInstall [<adapter>...]`：安装适配器
- `:DapUnistall <adapter> ...`：卸载适配器

**输入法切换**

如果你需要在 normal 模式和 insert 模式之间自动切换中英文输入法，并且你使用的是 WSL
可以参阅 [tuilk.cnblog](https://www.cnblogs.com/tuilk/p/16421831.html)。

如果是 Linux 环境，同时使用的是 fcitx5 框架，可以参阅 [fcitx](https://wiki.archlinux.org/title/Fcitx#Vim)

## 如何使用💻

输入如下命令克隆该库：

```sh
git clone git@github.com:Kohirus/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
```

然后输入 `nvim` 以启动它，它会自动安装所有插件。如果看到报错，无需理会，重启 neovim 即可。

在 neovim 中，输入 `:Mason` 可以看到 lsp/dap/formatter/lint 服务器的安装详情。

文件结构如下所示：

```sh
~/.config/nvim
├── init.lua			启动文件
├── ftplugin/			不同文件类型的缩进规则
└── lua/			
    ├── core/
    │   ├── autocmd.lua		关于自动命令
    │   ├── options.lua		关于 neovim 的一些基础设置
    │   ├── mappings.lua	关于基本的映射
    │   ├── plugins.lua		关于插件
    │   ├── lazy_load.lua	用于延迟加载
    │   └── utils.lua		通用的一些函数
    ├── conf/			存放各个插件的相关配置
    │   ├── others.lua      	存放一些简单的插件配置
    │   └── ...			
    └── themes/			存放主题相关的配置
```

## 插件列表💡

**插件管理器/基础插件**
- [x] [packer](https://github.com/wbthomason/packer.nvim)：插件管理器
- [x] [plenary](https://github.com/nvim-lua/plenary.nvim)：其他插件可能会使用到的 Lua 函数
- [x] [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)：其他插件可能会使用到的图标集合
- [x] [popup](https://github.com/nvim-lua/popup.nvim)：其他插件可能会使用到的 Lua 函数

**LSP**
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)：lsp 服务器的相关配置
- [x] [lspsaga.nvim](https://github.com/kkharji/lspsaga.nvim)：lsp 相关的 UI
- [x] [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)：函数签名提示
- [x] [mason.nvim](https://github.com/williamboman/mason.nvim)：轻松安装 LSP 服务器、DAP 服务器、linter 和格式化程序
- [x] [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): 沟通 lspconfig 和 mason.nvim 的桥梁

**代码补全**
- [x] [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)：代码补全
- [x] [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)：lsp 补全
- [x] [cmp-path](https://github.com/hrsh7th/cmp-path)：路径补全
- [x] [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)：缓冲区补全
- [x] [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)：智能 AI 补全
- [x] [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)：lua 补全
- [x] [LuaSnip](https://github.com/L3MON4D3/LuaSnip)：代码片段相关
- [x] [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)：代码片段相关
- [x] [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)：命令行补全

**语法高亮**
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)：语法高亮
- [x] [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)：文本对象
- [x] [hlargs.nvim](https://github.com/m-demare/hlargs.nvim)：高亮函数参数
- [x] [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)：彩虹括号
- [x] [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)

**查找、跳转**
- [x] [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)：查找
- [x] [nvim-hslens](https://github.com/kevinhwang91/nvim-hlslens)：高亮查找
- [x] [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)：查找/替换
- [x] [hop.nvim](https://github.com/phaazon/hop.nvim)：快速跳转到行、词、字符
- [x] [cppassist.nvim](https://github.com/Kohirus/cppassist.nvim): 类似 VAssistX 的功能

**主题**
- [x] [catppuccin](https://github.com/catppuccin/nvim)
- [x] [zephyr](https://github.com/glepnir/zephyr-nvim)
- [x] [onedarkpro](https://github.com/olimorris/onedarkpro.nvim)

**工具**
- [x] [nvim-notify](https://github.com/rcarriga/nvim-notify)：通知
- [x] [alpha-nvim](https://github.com/goolord/alpha-nvim)：启动界面
- [x] [which-key.nvim](https://github.com/folke/which-key.nvim)：快捷键面板
- [x] [switch](https://github.com/AndrewRadev/switch.vim)：快速切换反义单词
- [x] [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)：高亮显示 16 进制颜色
- [x] [nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)：终端
- [x] [nvim-comment.nvim](https://github.com/terrortylor/nvim-comment)：注释
- [x] [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)：TODO
- [x] [formatter.nvim](https://github.com/mhartington/formatter.nvim)：代码格式化
- [x] [nvim-autopairs](https://github.com/windwp/nvim-autopairs)：自动括号
- [x] [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)：缩进线
- [x] [vim-illuminate](https://github.com/RRethy/vim-illuminate)：高亮显示光标单词
- [x] [project.nvim](https://github.com/ahmedkhalf/project.nvim)：提供卓越的项目管理功能

**运行/调试**
- [x] [nvim-dap](https://github.com/mfussenegger/nvim-dap)：调试
- [x] [nvim-gdb](https://github.com/sakhnik/nvim-gdb)：gdb 调试
- [x] [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)：调试 UI
- [x] [mason-nvim-dap](https://github.com/jayp0521/mason-nvim-dap.nvim): 沟通 nvim-dap 和 mason.nvim 的桥梁
- [x] [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)：运行代码

**工作区域**
- [x] [barbar.nvim](https://github.com/romgrk/barbar.nvim)：标签页
- [x] [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)：状态栏
- [x] [undotree](https://github.com/mbbill/undotree)：撤销树
- [x] [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)：符号大纲
- [x] [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)：文件树

**Git**
- [x] [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)：显示文件修改标记
- [x] [diffview.nvim](https://github.com/sindrets/diffview.nvim)：文件差异对比

## 常用网站🌎

- [neovimcraft](http://neovimcraft.com/)
- [awesome-neovim](https://github.com/askfiy/awesome-neovim)
- [vim document](https://yianwillis.github.io/vimcdoc/doc/quickref.html#option-list)
- [nvim document](https://neovim.io/doc/user/vim_diff.html)
- [LSP Server](https://github.com/williamboman/nvim-lsp-installer#available-lsps)
- [LSP Default Configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [Nerd Font](https://www.nerdfonts.com/)
- [clang-format document](https://clang.llvm.org/docs/ClangFormatStyleOptions.html#)

## 快捷键⌨️

### 基础键位

默认的 `<leader>` 键为 `;`。

按下 `<Space>` 可以打开 [which-key](https://github.com/folke/which-key.nvim), 按下 `<Backspace>` 可以返回上一菜单。

按下 `<Ctrl + \>` 可以打开/关闭终端。

|   模式   |      快捷键      |                描述                |
| :------: | :--------------: | :--------------------------------: |
| `normal` | `Ctrl + h/j/k/l` |    在窗口间移动光标                |
| `normal` | `Ctrl + ↑/↓/←/→` |           改变窗口大小             |
| `normal` |   `Ctrl + u/d`   |            Page Up/Down            |
| `normal` |   `Alt + j/k`    |     将当前行向上/下移动            |
| `normal` |  `Shift + e/r`   |     切换到上一个/下一个标签页      |
| `normal` |  `<leader> + s`  |         转换为反义单词             |
| `normal` |       `<`        |      将当前标签页向左移动          |
| `normal` |       `>`        |      将当前标签页向右移动          |
| `normal` |    `Ctrl + s`    |            保存当前文件            |
| `normal` |      `ESC`       |              关闭高亮搜索          |
| `normal` |    `Ctrl + c`    |         复制当前文件的所有内容     |
| `normal` |  `<leader> + c`  |             跳转到字符             |
| `normal` |  `<leader> + w`  |             跳转到单词             |
| `normal` |  `<leader> + l`  |             跳转到行               |
| `normal` |  `<leader> + r`  |              运行当前文件          |
| `normal` | `<leader> + rc`  |             关闭运行窗口           |
| `normal` |      `H/L`       |           跳转到行首/行尾          |
| `visual` |     `< / >`      |            改变缩进                |
| `visual` |   `Alt + j/k`    |         将当前块向上/下移动        |
| `visual` |    `Alt + /`     |           注释所选块               |
| `visual` |      `H/L`       |            跳转到行首/行尾         |
| `insert` |       `jk`       |              退出插入模式          |
| `insert` |   `Alt + j/k`    |         将当前行向上/向下移动      |
| `insert` | `Alt + ↑/↓/←/→`  |             在窗口间移动光标       |
| `insert` |   `Ctrl + a/e`   |           跳转到行首/行尾          |

### 文件树

| 快捷键         | 描述                                      |
| -------------- | ----------------------------------------- |
| `<leader> + e` | 打开/关闭文件树                           |
| `<leader> + f` | 在文件树中定位当前文件                    |
| `o`            | 打开文件/目录                             |
| `a`            | 创建文件/目录                             |
| `r`            | 重命名文件/目录                           |
| `x`            | 剪切文件/目录                             |
| `c`            | 复制文件/目录                             |
| `d`            | 删除文件/目录                             |
| `y`            | 复制文件/目录的名称                       |
| `Y`            | 复制文件/目录的相对路径                   |
| `gy`           | 复制文件/目录的绝对路径                   |
| `p`            | 粘贴文件/目录                             |
| `s`            | 使用默认程序打开文件/目录                 |
| `Tab`          | 将文件添加到缓冲区但是不移动光标          |
| `Ctrl + v`     | 以垂直分割窗口打开文件                    |
| `Ctrl + x`     | 以水平分割窗口打开文件                    |
| `Ctrl + ]`     | 进入光标下的目录                          |
| `Ctrl + r`     | 重命名文件/目录，同时删除同名文件/目录    |
| `-`            | 返回父目录                                |
| `I`            | 显示/隐藏 隐藏文件                        |
| `H`            | 显示/隐藏 点文件                          |
| `R`            | 刷新文件树                                |

### 代码导航

| 快捷键   | 描述                         |
| :------: | :--------------------------: |
|   `][`   | 跳转到下一个函数的开头       |
|   `]]`   | 跳转到下一个函数的结尾       |
|   `[[`   | 跳转到上一个函数的开头       |
|   `[]`   | 跳转到上一个函数的结尾       |
|   `af`   | 跳出函数外                   |
|   `if`   | 跳到函数内                   |
|   `ac`   | 跳到类外                     |
|   `ic`   | 跳到类内                     |
|  `<CR>`  | 初始化文本块                 |
|  `<CR>`  | 增大文本块                   |
|  `<BS>`  | 缩小文本块                   |
| `<TAB>`  | 选择一个范围                 |

### LSP

| 快捷键          | 描述                                 |
| :-------------: | :----------------------------------: |
| `<leader> + ca` | 查看代码行为                         |
| `<leader> + cd` | 查看代码诊断                         |
|      `K`        | 查看悬浮文档                         |
|  `Ctrl + b/f`   | 向上/向下翻页                        |
|      `gs`       | 签名帮助                             |
|      `gr`       | 重命名变量                           |
|      `gd`       | 查看预览定义                         |
|      `gh`       | 异步lsp查找: 查找光标处的定义和引用  |
|      `g[`       | 跳转到上一个诊断                     |
|      `g]`       | 跳转到下一个诊断                     |

### CPP助手

| 快捷键          | 描述                                 |
| :-------------: | :----------------------------------: |
| `<leader> + df` | 在源文件中生成函数定义               |
| `<leader> + dv` | 在当前文件中生成函数定义             |
| `<leader> + gh` | 跳转到光标所在处的头文件             |
|    `Alt + o`    | 快速切换头文件/源文件                |

### Git

| 快捷键           | 描述                 |
| :--------------: | :------------------: |
| `<leader> + k/j` | 上一个/下一个 hunk   |
| `<leader> + hs`  | 提交 hunk            |
| `<leader> + hu`  | 取消提交 hunk        |
| `<leader> + hr`  | 重置 hunk            |
| `<leader> + hp`  | 预览 hunk            |
|  `<sapce> + gd`  | 文件差异             |
|  `<space> + gf`  | 文件历史             |

### 代码注释

| 快捷键        | 描述        |
| :-----------: | :---------: |
| `<Space> + /` | 注释当前行  |
|   `Alt + /`   | 注释所选块  |
|     `gcc`     | 注释当前行  |
|     `gc`      | 注释所选块  |

### 符号大纲

| 快捷键         | 描述                                       |
| :------------: | :----------------------------------------: |
| `<Space> + do` | 打开/关闭 符号大纲                         |
|   `<Esc>/q`    | 退出符号大纲                               |
|     `<CR>`     | 跳转到当前符号在代码中的位置               |
|      `o`       | 跳转到当前符号在代码中的位置但是不失去焦点 |
| `Ctrl + Space` | 悬浮当前符号                               |
|      `K`       | 切换当前符号预览                           |
|      `r`       | 重命名当前符号                             |
|      `a`       | 查看代码行为                               |
|      `?`       | 显示帮助面板                               |

### DAP

| 快捷键         | 描述                         |
| :------------: | :--------------------------: |
|     `<F8>`     | 设置/清除当前行的断点        |
| `<leader> + b` | 设置条件断点                 |
|     `<F6>`     | 停止调试                     |
|     `<F5>`     | 启动调试/继续运行            |
|     `<F9>`     | 跳过                         |
|    `<F10>`     | 跳入                         |
|    `<F11>`     | 跳出                         |
|      `K`       | 查看当前变量                 |

### GDB

| 快捷键       | 描述           |
| :----------: | :------------: |
| `<leader>dd` | 启动调试       |
|     `-n`     | 跳过           |
|     `-s`     | 跳入           |
|     `-f`     | 跳出           |
|     `-c`     | 继续运行       |
|     `-u`     | 运行到当前行   |
|     `-b`     | 设置断点       |

## 常见问题❓

1. 如何使用 lsp 进行代码跳转等操作？

- 如果项目是通过 makefile 进行管理的，则可以下载 [bear](https://github.com/rizsotto/Bear) 工具，
然后在项目目录下输入 `bear -- make` 即可(如果 gRPC 对端关闭，可能需要关闭代理)。
- 如果项目是通过 cmake 进行管理的，定义如下内容即可：

```cmake
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```
