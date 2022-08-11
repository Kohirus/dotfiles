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

请参阅 [formatter](https://github.com/mhartington/formatter.nvim) 然后安装你自己的格式化程序。

在这个库中，我使用如下格式化程序：

- stylua: 格式化 Lua
- clang-foramt: 格式化 C/C++

> 如果需要在保存文件时自动格式化，只需要取消 [autocmd](https://github.com/tuilk/Neovim/blob/main/lua/core/autocmd.lua#L56-L61) 中的注释

**LSP**

你需要参阅 [lsp server](https://github.com/williamboman/nvim-lsp-installer#available-lsps) 和
[defaultconfiguration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
为你的语言选择合适的服务器和基本配置。

在这个库中，我使用了如下 lsp 服务器：

- stylua: 用于 Lua 语言
- clangd: 用于 C/C++ 语言

**调试**

你需要参阅 [nvim-dap](https://github.com/mfussenegger/nvim-dap) 以选择你的调试配置。

**输入法切换**

如果你需要在 normal 模式和 insert 模式之间自动切换中英文输入法，并且你使用的是 WSL
可以参阅 [tuilk.cnblog](https://www.cnblogs.com/tuilk/p/16421831.html)。

如果是 Linux 环境，同时使用的是 fcitx5 框架，可以参阅 [fcitx](https://wiki.archlinux.org/title/Fcitx#Vim)

## 如何使用💻

输入如下命令克隆该库：

```sh
git clone https://github.com/tuilk/Neovim.git ~/.config/nvim
```

然后输入 `nvim` 以启动它，它会自动安装所有插件。如果看到报错，无需理会，重启 neovim 即可。

在 neovim 中，输入 `:LspInstallInfo` 可以看到 lsp 服务器的安装详情。

然后输入 `:DIInstall ccpr_vsc` 为 C/C++ 语言安装调试配置。

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
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)：lsp 配置
- [x] [lspsaga.nvim](https://github.com/tami5/lspsaga.nvim)：lsp 相关的 UI
- [x] [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)：函数签名提示
- [x] [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)：更容易安装 lsp 相关服务器

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

**查找、调整**
- [x] [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)：查找
- [x] [nvim-hslens](https://github.com/kevinhwang91/nvim-hlslens)：高亮查找
- [x] [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)：查找/替换
- [x] [hop.nvim](https://github.com/phaazon/hop.nvim)：快速跳转到行、词、字符

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

**运行/调试**
- [x] [nvim-dap](https://github.com/mfussenegger/nvim-dap)：调试
- [x] [nvim-gdb](https://github.com/sakhnik/nvim-gdb)：gdb 调试
- [x] [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)：调试 UI
- [x] [DAPInstall.nvim](https://github.com/Pocco81/DAPInstall.nvim)：安装 dap 相关配置
- [x] [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)：运行代码

**区域**
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

## Keyboard Shortcuts⌨️

### Basic

> Default `<leader>` key is `;`, press `<Space>` can toggle [which-key](https://github.com/folke/which-key.nvim), 
press `<Backspace>` can return previous menu, press `<Ctrl+\>` can toggle terminal。

|   Mode   |    Shortcuts     |            Discription             |
| :------: | :--------------: | :--------------------------------: |
| `normal` | `Ctrl + h/j/k/l` |    move cursor between windows     |
| `normal` | `Ctrl + ↑/↓/←/→` |           resize window            |
| `normal` |   `Ctrl + u/d`   |            Page Up/Down            |
| `normal` |   `Alt + j/k`    |     move current line up/down      |
| `normal` |  `Shift + e/r`   |     switch the left/right tab      |
| `normal` |  `<leader> + s`  |      switch the opposite word      |
| `normal` |       `<`        |      move current tab to left      |
| `normal` |       `>`        |     move current tab to right      |
| `normal` |    `Ctrl + s`    |         save current file          |
| `normal` |      `ESC`       |       close highlight search       |
| `normal` |    `Ctrl + c`    |  copy all content in current file  |
| `normal` |  `<leader> + c`  |             goto char              |
| `normal` |  `<leader> + w`  |             goto word              |
| `normal` |  `<leader> + l`  |             goto line              |
| `normal` |  `<leader> + r`  |          run current file          |
| `normal` | `<leader> + rc`  |          close run window          |
| `normal` |      `H/L`       | goto the beginning/end of the line |
| `visual` |     `< / >`      |         change indentation         |
| `visual` |   `Alt + j/k`    |     move current block up/down     |
| `visual` |    `Alt + /`     |           comment block            |
| `visual` |      `H/L`       | goto the beginning/end of the line |
| `insert` |       `jk`       |          exit insert mode          |
| `insert` |   `Alt + j/k`    |     move current line up/down      |
| `insert` | `Alt + ↑/↓/←/→`  |    move cursor between windows     |

### File Explorer

| Shortcuts      | Discription                                            |
| -------------- | ------------------------------------------------------ |
| `<leader> + e` | toggle file explore                                    |
| `<leader> + f` | locate current file in file explore                    |
| `o`            | open file/directory                                    |
| `a`            | create file/directory                                  |
| `r`            | rename file/directory                                  |
| `x`            | cut file/directory                                     |
| `c`            | copy file/directory                                    |
| `d`            | delete file/directory                                  |
| `y`            | copy file/directory name                               |
| `Y`            | copy file/directory relative path                      |
| `gy`           | copy file/directory absolute path                      |
| `p`            | paste file/directory                                   |
| `s`            | use default program to open file/directory             |
| `Tab`          | add file to buffer, but don't move cursor              |
| `Ctrl + v`     | open file for vertical spilt                           |
| `Ctrl + x`     | open file for horizontal spilt                         |
| `Ctrl + ]`     | enter the directory under cursor                       |
| `Ctrl + r`     | rename file/directory, and delete exist file/directory |
| `-`            | return the parent directory                            |
| `I`            | toggle hidden file                                     |
| `H`            | toggle dot file                                        |
| `R`            | refresh file explorer                                  |

### Code Navigation

| Shortcuts|               Discription               |
| :------: | :-------------------------------------: |
|   `][`   |   goto the beginning of next function   |
|   `]]`   |      goto the end of next function      |
|   `[[`   | goto the beginning of previous function |
|   `[]`   |    goto the end of previous function    |
|   `af`   |          goto out of function           |
|   `if`   |         goto inner of function          |
|   `ac`   |            goto out of class            |
|   `ic`   |           goto inner of class           |
|  `<CR>`  |             init the block              |
|  `<CR>`  |           increase the block            |
|  `<BS>`  |           decrease the block            |
| `<TAB>`  |             select a scope              |

### Code Action

|    Shortcuts    |        Discription        |
| :-------------: | :-----------------------: |
| `<leader> + ca` |     view code action      |
|      `gh`       |    view float document    |
|  `Ctrl + u/d`   |       page up/down        |
|      `gs`       |      signature help       |
| `<leader> + cn` |      rename variable      |
|      `pd`       |    preview definiation    |
|      `gd`       |   show code diagnostics   |
|      `g[`       | goto previous diagnostics |
|      `g]`       |   goto next diagnostics   |

### Git

|    Shortcuts     |    Discription     |
| :--------------: | :----------------: |
| `<leader> + k/j` |   prev/next hunk   |
| `<leader> + hs`  |     stage hunk     |
| `<leader> + hu`  |    unstage hunk    |
| `<leader> + hr`  |     reset hunk     |
| `<leader> + hp`  |    preview hunk    |
|  `<sapce> + gd`  |     diff file      |
|  `<space> + gf`  |    file history    |

### Comment

|   Shortcuts   |      Discription      |
| :-----------: | :-------------------: |
| `<Space> + /` | comment current line  |
|   `Alt + /`   | comment current block |
|     `gcc`     | comment current line  |
|     `gc`      | comment current block |

### Symbol Outline

|   Shortcuts    |                Discription                |
| :------------: | :---------------------------------------: |
| `<Space> + do` |           toggle symbol outline           |
|   `<Esc>/q`    |               quit outline                |
|     `<CR>`     |       goto symbol location in code        |
|      `o`       | goto symbol location but don't lose focus |
| `Ctrl + Space` |           float current symbol            |
|      `K`       |       switch current symbol preview       |
|      `r`       |               rename symbol               |
|      `a`       |                code action                |
|      `?`       |              show help info               |

### DAP

|   Shortcuts    |         Discription          |
| :------------: | :--------------------------: |
|     `<F8>`     | set/clear current breakpoint |
| `<leader> + b` |  set conditional breakpoint  |
|     `<F6>`     |          stop debug          |
|     `<F5>`     |    startup debug/continue    |
|     `<F9>`     |             skip             |
|    `<F10>`     |           jump in            |
|    `<F11>`     |           jump out           |
|      `K`       |    view current variable     |

### GDB

|  Shortcuts   |     Discription     |
| :----------: | :-----------------: |
| `<leader>dd` |    startup debug    |
|     `-n`     |        skip         |
|     `-s`     |       jump in       |
|     `-f`     |      jump out       |
|     `-c`     |      continue       |
|     `-u`     | run to current line |
|     `-b`     |   set breakpoint    |
