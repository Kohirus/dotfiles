local options = {
	backup = false, -- 创建备份文件
	clipboard = "unnamedplus", -- 允许 neovim 使用系统剪切板
	cmdheight = 1, -- 保持状态栏位置位于底部
	completeopt = { "menu", "menuone", "noselect" }, -- 补全设置 不自动选中
	conceallevel = 0, -- 保证在 markdown 文件中 `` 是可见的
	fileencoding = "utf-8", -- 文件编码
	hlsearch = true, -- 高亮搜索
	ignorecase = true, -- 搜索忽略大小写
	mouse = "a", -- 允许 neovim 使用鼠标
	pumheight = 10, -- 弹出菜单的高度
	showmode = false, -- 关闭当前模式
	showtabline = 2, -- 总是显示 tab
	smartcase = true, -- 智能匹配搜索大小写
	smartindent = true, -- 自动缩进
	splitbelow = true, -- 水平布局时新窗口位于当前窗口之下
	splitright = true, -- 垂直布局时新窗口位于当前窗口右侧
	swapfile = false, -- 创建交换文件
	termguicolors = true, -- 是否开启 xterm 兼容的终端 24 位色彩支持
	timeoutlen = 500, -- 操作等待时间
	undofile = true, -- 允许撤销操作
	updatetime = 300, -- 更新修改时间
	writebackup = false, -- 如果文件被另一个进程修改，不允许被修改
	cursorline = true, -- 高亮当前行
	cursorcolumn = false, -- 高亮当前列
	number = true, -- 行号
	relativenumber = false, -- 相对行号
	numberwidth = 4, -- 行号区宽度
	signcolumn = "yes", -- 显示左侧图标指示列
	filetype = "plugin", -- 文件缩进策略
	wrap = false, -- 折行
	scrolloff = 8, -- jk移动时光标上下保留8行
	sidescrolloff = 8, -- hl移动时光标左右保留8列
	guifont = "monospace:h17", -- neovim 字体
	foldmethod = "expr", -- 通过 nvim-treesitter 折叠代码
	foldexpr = "nvim_treesitter#foldexpr()",
	foldenable = false, -- 折叠代码
	foldlevel = 99, -- 如果不设置这个，每处都可以折叠
	spell = false, -- 拼写检查
	spelllang = { "en_us" }, -- 单词拼写检查的语言
	diffopt = "vertical,filler,internal,context:4",
	-- cscopequickfix = "s-,c-,d-,i-,t-,e-", -- cscope 输出到 quickfix 窗口
}

vim.opt.shortmess:append("c")
-- 使用 bash 执行命令 而不是 shell 加快速度
vim.opt.shell = "/bin/bash"

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- 行结尾可以跳到下一行
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

-- 指定 undotree 缓存存放路径
vim.g.undotree_dir = "~/.cache/nvim/undodir"
