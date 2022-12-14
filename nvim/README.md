# Neovim

![startup](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_neovim_startup.png)

![neovim](https://raw.githubusercontent.com/tuilk/Image/main/screenshot_neovim_new.png)

## ä¾èµð¨

- [Neovim](https://github.com/neovim/neovim) >= 0.7.0
- [fd](https://github.com/sharkdp/fd): ç¨äº [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [ripgrep](https://github.com/BurntSushi/ripgrep): ç¨äº [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Nerd Font](https://www.nerdfonts.com/): ç¨äºå¾æ å­ä½
- unzip: ç¨äºè§£å [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) æ°æ®
- wget: ç¨äºä¸è½½ [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) æ°æ®

## æ³¨æâ ï¸

**æ ¼å¼å**

è¯·åé [formatter](https://github.com/mhartington/formatter.nvim) éæ©èªå·±éè¦çæ ¼å¼åç¨åºã

ç¶åå¯å¨ Neovimï¼è¾å¥ `:Mason` æå¼å®è£çé¢ï¼æä¸æ°å­ 5 è·³è½¬å°æ ¼å¼åç¨åºé¡µé¢ï¼éæ©èªå·±éè¦çæ ¼å¼å
ç¨åºç¶åæä¸ `i` é®è¿è¡å®è£å³å¯ãä¹åï¼æå¼ `~/.config/nvim/lua/conf` ç®å½ä¸ç `formatter.lua` æ
ä»¶ï¼å¨å¶ä¸­æ·»å èªå·±éè¦çæ ¼å¼åéé¡¹ã

å¨è¿ä¸ªåºä¸­ï¼æä½¿ç¨å¦ä¸æ ¼å¼åç¨åºï¼

- stylua: æ ¼å¼å Lua
- clang-foramt: æ ¼å¼å C/C++

> å¦æéè¦å¨ä¿å­æä»¶æ¶èªå¨æ ¼å¼åï¼åªéè¦åæ¶ [autocmd](https://github.com/tuilk/Neovim/blob/main/lua/core/autocmd.lua#L56-L61) ä¸­çæ³¨é

**LSP**

ä½ éè¦åé [lsp server](https://github.com/williamboman/nvim-lsp-installer#available-lsps) å
[default_configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
ä¸ºä½ çè¯­è¨éæ©åéçæå¡å¨ååºæ¬éç½®ã

ç¶åæå¼ `~/.config/nvim/lua/conf` è·¯å¾ä¸ç `others.lua` æä»¶ï¼æ¾å° `mason_lspconfig()` å½æ°ï¼
å¨ `ensure_installed` éé¡¹ä¸­æ·»å èªå·±éè¦çè¯­è¨æå¡å¨ï¼ä¹åå¨å¯å¨ Neovim åä¼èªå¨å®è£ã

ç¶åæå¼ `lsp_config.lua` æä»¶ï¼å¨æä»¶æ«å°¾æ·»å è¯¥è¯­è¨æå¡å¨çç¸å³éç½®éé¡¹ã 

å¨è¿ä¸ªåºä¸­ï¼æä½¿ç¨äºå¦ä¸ lsp æå¡å¨ï¼

- stylua: ç¨äº Lua è¯­è¨
- clangd: ç¨äº C/C++ è¯­è¨
- cmake: ç¨äº Cmake è¯­è¨

å¯ä»¥è¾å¥å¦ä¸å½ä»¤å®è£/å¸è½½ LSP æå¡å¨ï¼

- `:LspInstall [<server>...]`ï¼å®è£æå¡å¨
- `:LspUninstall <server> ...`ï¼å¸è½½æå¡å¨

**è°è¯**

ä½ éè¦åé [nvim-dap](https://github.com/mfussenegger/nvim-dap) å
[mason-nvim-dap](https://github.com/jayp0521/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua) 
éæ©æéè¦ç dap æå¡å¨ã

ç¶åæå¼ `~/.config/nvim/lua/conf` è·¯å¾ä¸ç `others.lua` æä»¶ï¼æ¾å° `mason_dap()` å½æ°,
ä¿®æ¹å¶ä¸­ç `ensure_installed` éé¡¹ä¸ºèªå·±æéè¦ç dap æå¡å¨ï¼å¨å¯å¨ Neovim åä¼èªå¨å®è£ã

å¨è¿ä¸ªåºä¸­ï¼æä½¿ç¨äºå¦ä¸ dap æå¡å¨ï¼

- cpptools: ç¨äº C/C++ è¯­è¨

å¯ä»¥è¾å¥å¦ä¸å½ä»¤å®è£/å¸è½½ DAP æå¡å¨ï¼

- `:DapInstall [<adapter>...]`ï¼å®è£ééå¨
- `:DapUnistall <adapter> ...`ï¼å¸è½½ééå¨

**è¾å¥æ³åæ¢**

å¦æä½ éè¦å¨ normal æ¨¡å¼å insert æ¨¡å¼ä¹é´èªå¨åæ¢ä¸­è±æè¾å¥æ³ï¼å¹¶ä¸ä½ ä½¿ç¨çæ¯ WSL
å¯ä»¥åé [tuilk.cnblog](https://www.cnblogs.com/tuilk/p/16421831.html)ã

å¦ææ¯ Linux ç¯å¢ï¼åæ¶ä½¿ç¨çæ¯ fcitx5 æ¡æ¶ï¼å¯ä»¥åé [fcitx](https://wiki.archlinux.org/title/Fcitx#Vim)

## å¦ä½ä½¿ç¨ð»

è¾å¥å¦ä¸å½ä»¤åéè¯¥åºï¼

```sh
git clone git@github.com:Kohirus/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
```

ç¶åè¾å¥ `nvim` ä»¥å¯å¨å®ï¼å®ä¼èªå¨å®è£æææä»¶ãå¦æçå°æ¥éï¼æ éçä¼ï¼éå¯ neovim å³å¯ã

å¨ neovim ä¸­ï¼è¾å¥ `:Mason` å¯ä»¥çå° lsp/dap/formatter/lint æå¡å¨çå®è£è¯¦æã

æä»¶ç»æå¦ä¸æç¤ºï¼

```sh
~/.config/nvim
âââ init.lua			å¯å¨æä»¶
âââ ftplugin/			ä¸åæä»¶ç±»åçç¼©è¿è§å
âââ lua/			
    âââ core/
    â   âââ autocmd.lua		å³äºèªå¨å½ä»¤
    â   âââ options.lua		å³äº neovim çä¸äºåºç¡è®¾ç½®
    â   âââ mappings.lua	å³äºåºæ¬çæ å°
    â   âââ plugins.lua		å³äºæä»¶
    â   âââ lazy_load.lua	ç¨äºå»¶è¿å è½½
    â   âââ utils.lua		éç¨çä¸äºå½æ°
    âââ conf/			å­æ¾åä¸ªæä»¶çç¸å³éç½®
    â   âââ others.lua      	å­æ¾ä¸äºç®åçæä»¶éç½®
    â   âââ ...			
    âââ themes/			å­æ¾ä¸»é¢ç¸å³çéç½®
```

## æä»¶åè¡¨ð¡

**æä»¶ç®¡çå¨/åºç¡æä»¶**
- [x] [packer](https://github.com/wbthomason/packer.nvim)ï¼æä»¶ç®¡çå¨
- [x] [plenary](https://github.com/nvim-lua/plenary.nvim)ï¼å¶ä»æä»¶å¯è½ä¼ä½¿ç¨å°ç Lua å½æ°
- [x] [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)ï¼å¶ä»æä»¶å¯è½ä¼ä½¿ç¨å°çå¾æ éå
- [x] [popup](https://github.com/nvim-lua/popup.nvim)ï¼å¶ä»æä»¶å¯è½ä¼ä½¿ç¨å°ç Lua å½æ°

**LSP**
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)ï¼lsp æå¡å¨çç¸å³éç½®
- [x] [lspsaga.nvim](https://github.com/kkharji/lspsaga.nvim)ï¼lsp ç¸å³ç UI
- [x] [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)ï¼å½æ°ç­¾åæç¤º
- [x] [mason.nvim](https://github.com/williamboman/mason.nvim)ï¼è½»æ¾å®è£ LSP æå¡å¨ãDAP æå¡å¨ãlinter åæ ¼å¼åç¨åº
- [x] [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): æ²é lspconfig å mason.nvim çæ¡¥æ¢

**ä»£ç è¡¥å¨**
- [x] [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)ï¼ä»£ç è¡¥å¨
- [x] [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)ï¼lsp è¡¥å¨
- [x] [cmp-path](https://github.com/hrsh7th/cmp-path)ï¼è·¯å¾è¡¥å¨
- [x] [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)ï¼ç¼å²åºè¡¥å¨
- [x] [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)ï¼æºè½ AI è¡¥å¨
- [x] [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)ï¼lua è¡¥å¨
- [x] [LuaSnip](https://github.com/L3MON4D3/LuaSnip)ï¼ä»£ç çæ®µç¸å³
- [x] [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)ï¼ä»£ç çæ®µç¸å³
- [x] [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)ï¼å½ä»¤è¡è¡¥å¨

**è¯­æ³é«äº®**
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)ï¼è¯­æ³é«äº®
- [x] [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)ï¼ææ¬å¯¹è±¡
- [x] [hlargs.nvim](https://github.com/m-demare/hlargs.nvim)ï¼é«äº®å½æ°åæ°
- [x] [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)ï¼å½©è¹æ¬å·
- [x] [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)

**æ¥æ¾ãè·³è½¬**
- [x] [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)ï¼æ¥æ¾
- [x] [nvim-hslens](https://github.com/kevinhwang91/nvim-hlslens)ï¼é«äº®æ¥æ¾
- [x] [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)ï¼æ¥æ¾/æ¿æ¢
- [x] [hop.nvim](https://github.com/phaazon/hop.nvim)ï¼å¿«éè·³è½¬å°è¡ãè¯ãå­ç¬¦
- [x] [cppassist.nvim](https://github.com/Kohirus/cppassist.nvim): ç±»ä¼¼ VAssistX çåè½

**ä¸»é¢**
- [x] [catppuccin](https://github.com/catppuccin/nvim)
- [x] [zephyr](https://github.com/glepnir/zephyr-nvim)
- [x] [onedarkpro](https://github.com/olimorris/onedarkpro.nvim)

**å·¥å·**
- [x] [nvim-notify](https://github.com/rcarriga/nvim-notify)ï¼éç¥
- [x] [alpha-nvim](https://github.com/goolord/alpha-nvim)ï¼å¯å¨çé¢
- [x] [which-key.nvim](https://github.com/folke/which-key.nvim)ï¼å¿«æ·é®é¢æ¿
- [x] [switch](https://github.com/AndrewRadev/switch.vim)ï¼å¿«éåæ¢åä¹åè¯
- [x] [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)ï¼é«äº®æ¾ç¤º 16 è¿å¶é¢è²
- [x] [nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua)ï¼ç»ç«¯
- [x] [nvim-comment.nvim](https://github.com/terrortylor/nvim-comment)ï¼æ³¨é
- [x] [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)ï¼TODO
- [x] [formatter.nvim](https://github.com/mhartington/formatter.nvim)ï¼ä»£ç æ ¼å¼å
- [x] [nvim-autopairs](https://github.com/windwp/nvim-autopairs)ï¼èªå¨æ¬å·
- [x] [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)ï¼ç¼©è¿çº¿
- [x] [vim-illuminate](https://github.com/RRethy/vim-illuminate)ï¼é«äº®æ¾ç¤ºåæ åè¯
- [x] [project.nvim](https://github.com/ahmedkhalf/project.nvim)ï¼æä¾åè¶çé¡¹ç®ç®¡çåè½

**è¿è¡/è°è¯**
- [x] [nvim-dap](https://github.com/mfussenegger/nvim-dap)ï¼è°è¯
- [x] [nvim-gdb](https://github.com/sakhnik/nvim-gdb)ï¼gdb è°è¯
- [x] [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)ï¼è°è¯ UI
- [x] [mason-nvim-dap](https://github.com/jayp0521/mason-nvim-dap.nvim): æ²é nvim-dap å mason.nvim çæ¡¥æ¢
- [x] [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)ï¼è¿è¡ä»£ç 

**å·¥ä½åºå**
- [x] [barbar.nvim](https://github.com/romgrk/barbar.nvim)ï¼æ ç­¾é¡µ
- [x] [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)ï¼ç¶ææ 
- [x] [undotree](https://github.com/mbbill/undotree)ï¼æ¤éæ 
- [x] [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)ï¼ç¬¦å·å¤§çº²
- [x] [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)ï¼æä»¶æ 

**Git**
- [x] [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)ï¼æ¾ç¤ºæä»¶ä¿®æ¹æ è®°
- [x] [diffview.nvim](https://github.com/sindrets/diffview.nvim)ï¼æä»¶å·®å¼å¯¹æ¯

## å¸¸ç¨ç½ç«ð

- [neovimcraft](http://neovimcraft.com/)
- [awesome-neovim](https://github.com/askfiy/awesome-neovim)
- [vim document](https://yianwillis.github.io/vimcdoc/doc/quickref.html#option-list)
- [nvim document](https://neovim.io/doc/user/vim_diff.html)
- [LSP Server](https://github.com/williamboman/nvim-lsp-installer#available-lsps)
- [LSP Default Configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [Nerd Font](https://www.nerdfonts.com/)
- [clang-format document](https://clang.llvm.org/docs/ClangFormatStyleOptions.html#)

## å¿«æ·é®â¨ï¸

### åºç¡é®ä½

é»è®¤ç `<leader>` é®ä¸º `;`ã

æä¸ `<Space>` å¯ä»¥æå¼ [which-key](https://github.com/folke/which-key.nvim), æä¸ `<Backspace>` å¯ä»¥è¿åä¸ä¸èåã

æä¸ `<Ctrl + \>` å¯ä»¥æå¼/å³é­ç»ç«¯ã

|   æ¨¡å¼   |      å¿«æ·é®      |                æè¿°                |
| :------: | :--------------: | :--------------------------------: |
| `normal` | `Ctrl + h/j/k/l` |    å¨çªå£é´ç§»å¨åæ                 |
| `normal` | `Ctrl + â/â/â/â` |           æ¹åçªå£å¤§å°             |
| `normal` |   `Ctrl + u/d`   |            Page Up/Down            |
| `normal` |   `Alt + j/k`    |     å°å½åè¡åä¸/ä¸ç§»å¨            |
| `normal` |  `Shift + e/r`   |     åæ¢å°ä¸ä¸ä¸ª/ä¸ä¸ä¸ªæ ç­¾é¡µ      |
| `normal` |  `<leader> + s`  |         è½¬æ¢ä¸ºåä¹åè¯             |
| `normal` |       `<`        |      å°å½åæ ç­¾é¡µåå·¦ç§»å¨          |
| `normal` |       `>`        |      å°å½åæ ç­¾é¡µåå³ç§»å¨          |
| `normal` |    `Ctrl + s`    |            ä¿å­å½åæä»¶            |
| `normal` |      `ESC`       |              å³é­é«äº®æç´¢          |
| `normal` |    `Ctrl + c`    |         å¤å¶å½åæä»¶çææåå®¹     |
| `normal` |  `<leader> + c`  |             è·³è½¬å°å­ç¬¦             |
| `normal` |  `<leader> + w`  |             è·³è½¬å°åè¯             |
| `normal` |  `<leader> + l`  |             è·³è½¬å°è¡               |
| `normal` |  `<leader> + r`  |              è¿è¡å½åæä»¶          |
| `normal` | `<leader> + rc`  |             å³é­è¿è¡çªå£           |
| `normal` |      `H/L`       |           è·³è½¬å°è¡é¦/è¡å°¾          |
| `visual` |     `< / >`      |            æ¹åç¼©è¿                |
| `visual` |   `Alt + j/k`    |         å°å½åååä¸/ä¸ç§»å¨        |
| `visual` |    `Alt + /`     |           æ³¨éæéå               |
| `visual` |      `H/L`       |            è·³è½¬å°è¡é¦/è¡å°¾         |
| `insert` |       `jk`       |              éåºæå¥æ¨¡å¼          |
| `insert` |   `Alt + j/k`    |         å°å½åè¡åä¸/åä¸ç§»å¨      |
| `insert` | `Alt + â/â/â/â`  |             å¨çªå£é´ç§»å¨åæ        |
| `insert` |   `Ctrl + a/e`   |           è·³è½¬å°è¡é¦/è¡å°¾          |

### æä»¶æ 

| å¿«æ·é®         | æè¿°                                      |
| -------------- | ----------------------------------------- |
| `<leader> + e` | æå¼/å³é­æä»¶æ                            |
| `<leader> + f` | å¨æä»¶æ ä¸­å®ä½å½åæä»¶                    |
| `o`            | æå¼æä»¶/ç®å½                             |
| `a`            | åå»ºæä»¶/ç®å½                             |
| `r`            | éå½åæä»¶/ç®å½                           |
| `x`            | åªåæä»¶/ç®å½                             |
| `c`            | å¤å¶æä»¶/ç®å½                             |
| `d`            | å é¤æä»¶/ç®å½                             |
| `y`            | å¤å¶æä»¶/ç®å½çåç§°                       |
| `Y`            | å¤å¶æä»¶/ç®å½çç¸å¯¹è·¯å¾                   |
| `gy`           | å¤å¶æä»¶/ç®å½çç»å¯¹è·¯å¾                   |
| `p`            | ç²è´´æä»¶/ç®å½                             |
| `s`            | ä½¿ç¨é»è®¤ç¨åºæå¼æä»¶/ç®å½                 |
| `Tab`          | å°æä»¶æ·»å å°ç¼å²åºä½æ¯ä¸ç§»å¨åæ           |
| `Ctrl + v`     | ä»¥åç´åå²çªå£æå¼æä»¶                    |
| `Ctrl + x`     | ä»¥æ°´å¹³åå²çªå£æå¼æä»¶                    |
| `Ctrl + ]`     | è¿å¥åæ ä¸çç®å½                          |
| `Ctrl + r`     | éå½åæä»¶/ç®å½ï¼åæ¶å é¤ååæä»¶/ç®å½    |
| `-`            | è¿åç¶ç®å½                                |
| `I`            | æ¾ç¤º/éè éèæä»¶                        |
| `H`            | æ¾ç¤º/éè ç¹æä»¶                          |
| `R`            | å·æ°æä»¶æ                                 |

### ä»£ç å¯¼èª

| å¿«æ·é®   | æè¿°                         |
| :------: | :--------------------------: |
|   `][`   | è·³è½¬å°ä¸ä¸ä¸ªå½æ°çå¼å¤´       |
|   `]]`   | è·³è½¬å°ä¸ä¸ä¸ªå½æ°çç»å°¾       |
|   `[[`   | è·³è½¬å°ä¸ä¸ä¸ªå½æ°çå¼å¤´       |
|   `[]`   | è·³è½¬å°ä¸ä¸ä¸ªå½æ°çç»å°¾       |
|   `af`   | è·³åºå½æ°å¤                   |
|   `if`   | è·³å°å½æ°å                   |
|   `ac`   | è·³å°ç±»å¤                     |
|   `ic`   | è·³å°ç±»å                     |
|  `<CR>`  | åå§åææ¬å                 |
|  `<CR>`  | å¢å¤§ææ¬å                   |
|  `<BS>`  | ç¼©å°ææ¬å                   |
| `<TAB>`  | éæ©ä¸ä¸ªèå´                 |

### LSP

| å¿«æ·é®          | æè¿°                                 |
| :-------------: | :----------------------------------: |
| `<leader> + ca` | æ¥çä»£ç è¡ä¸º                         |
| `<leader> + cd` | æ¥çä»£ç è¯æ­                         |
|      `K`        | æ¥çæ¬æµ®ææ¡£                         |
|  `Ctrl + b/f`   | åä¸/åä¸ç¿»é¡µ                        |
|      `gs`       | ç­¾åå¸®å©                             |
|      `gr`       | éå½ååé                           |
|      `gd`       | æ¥çé¢è§å®ä¹                         |
|      `gh`       | å¼æ­¥lspæ¥æ¾: æ¥æ¾åæ å¤çå®ä¹åå¼ç¨  |
|      `g[`       | è·³è½¬å°ä¸ä¸ä¸ªè¯æ­                     |
|      `g]`       | è·³è½¬å°ä¸ä¸ä¸ªè¯æ­                     |

### CPPå©æ

| å¿«æ·é®          | æè¿°                                 |
| :-------------: | :----------------------------------: |
| `<leader> + df` | å¨æºæä»¶ä¸­çæå½æ°å®ä¹               |
| `<leader> + dv` | å¨å½åæä»¶ä¸­çæå½æ°å®ä¹             |
| `<leader> + gh` | è·³è½¬å°åæ æå¨å¤çå¤´æä»¶             |
|    `Alt + o`    | å¿«éåæ¢å¤´æä»¶/æºæä»¶                |

### Git

| å¿«æ·é®           | æè¿°                 |
| :--------------: | :------------------: |
| `<leader> + k/j` | ä¸ä¸ä¸ª/ä¸ä¸ä¸ª hunk   |
| `<leader> + hs`  | æäº¤ hunk            |
| `<leader> + hu`  | åæ¶æäº¤ hunk        |
| `<leader> + hr`  | éç½® hunk            |
| `<leader> + hp`  | é¢è§ hunk            |
|  `<sapce> + gd`  | æä»¶å·®å¼             |
|  `<space> + gf`  | æä»¶åå²             |

### ä»£ç æ³¨é

| å¿«æ·é®        | æè¿°        |
| :-----------: | :---------: |
| `<Space> + /` | æ³¨éå½åè¡  |
|   `Alt + /`   | æ³¨éæéå  |
|     `gcc`     | æ³¨éå½åè¡  |
|     `gc`      | æ³¨éæéå  |

### ç¬¦å·å¤§çº²

| å¿«æ·é®         | æè¿°                                       |
| :------------: | :----------------------------------------: |
| `<Space> + do` | æå¼/å³é­ ç¬¦å·å¤§çº²                         |
|   `<Esc>/q`    | éåºç¬¦å·å¤§çº²                               |
|     `<CR>`     | è·³è½¬å°å½åç¬¦å·å¨ä»£ç ä¸­çä½ç½®               |
|      `o`       | è·³è½¬å°å½åç¬¦å·å¨ä»£ç ä¸­çä½ç½®ä½æ¯ä¸å¤±å»ç¦ç¹ |
| `Ctrl + Space` | æ¬æµ®å½åç¬¦å·                               |
|      `K`       | åæ¢å½åç¬¦å·é¢è§                           |
|      `r`       | éå½åå½åç¬¦å·                             |
|      `a`       | æ¥çä»£ç è¡ä¸º                               |
|      `?`       | æ¾ç¤ºå¸®å©é¢æ¿                               |

### DAP

| å¿«æ·é®         | æè¿°                         |
| :------------: | :--------------------------: |
|     `<F8>`     | è®¾ç½®/æ¸é¤å½åè¡çæ­ç¹        |
| `<leader> + b` | è®¾ç½®æ¡ä»¶æ­ç¹                 |
|     `<F6>`     | åæ­¢è°è¯                     |
|     `<F5>`     | å¯å¨è°è¯/ç»§ç»­è¿è¡            |
|     `<F9>`     | è·³è¿                         |
|    `<F10>`     | è·³å¥                         |
|    `<F11>`     | è·³åº                         |
|      `K`       | æ¥çå½ååé                 |

### GDB

| å¿«æ·é®       | æè¿°           |
| :----------: | :------------: |
| `<leader>dd` | å¯å¨è°è¯       |
|     `-n`     | è·³è¿           |
|     `-s`     | è·³å¥           |
|     `-f`     | è·³åº           |
|     `-c`     | ç»§ç»­è¿è¡       |
|     `-u`     | è¿è¡å°å½åè¡   |
|     `-b`     | è®¾ç½®æ­ç¹       |

## å¸¸è§é®é¢â

1. å¦ä½ä½¿ç¨ lsp è¿è¡ä»£ç è·³è½¬ç­æä½ï¼

- å¦æé¡¹ç®æ¯éè¿ makefile è¿è¡ç®¡ççï¼åå¯ä»¥ä¸è½½ [bear](https://github.com/rizsotto/Bear) å·¥å·ï¼
ç¶åå¨é¡¹ç®ç®å½ä¸è¾å¥ `bear -- make` å³å¯(å¦æ gRPC å¯¹ç«¯å³é­ï¼å¯è½éè¦å³é­ä»£ç)ã
- å¦æé¡¹ç®æ¯éè¿ cmake è¿è¡ç®¡ççï¼å®ä¹å¦ä¸åå®¹å³å¯ï¼

```cmake
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```
