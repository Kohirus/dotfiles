vim.api.nvim_set_keymap("", ";", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
	insert_mode = generic_opts_any,
	normal_mode = generic_opts_any,
	visual_mode = generic_opts_any,
	visual_block_mode = generic_opts_any,
	command_mode = generic_opts_any,
	term_mode = { silent = true },
}

local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
}

local defaults = {
	insert_mode = {
		-- 退出插入模式
		["jk"] = "<ESC>",

		-- 文本上下移动
		["<A-j>"] = "<ESC>:m .+1<CR>==gi",
		["<A-k>"] = "<ESC>:m .-2<CR>==gi",

		-- 窗口间移动光标
		["<A-Up>"] = "<C-\\><C-N><C-w>k",
		["<A-Down>"] = "<C-\\><C-N><C-w>j",
		["<A-Left>"] = "<C-\\><C-N><C-w>h",
		["<A-Right>"] = "<C-\\><C-N><C-w>l",

		-- 跳转行首/行尾
		["<C-a>"] = "<ESC>^i",
		["<C-e>"] = "<End>",
	},

	normal_mode = {
		-- 窗口间移动光标
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",

		-- 调节窗口大小
		["<C-Up>"] = ":resize -2<CR>",
		["<C-Down>"] = ":resize +2<CR>",
		["<C-Left>"] = ":vertical resize -2<CR>",
		["<C-Right>"] = ":vertical resize +2<CR>",

		-- 翻页
		["<C-u>"] = "8k",
		["<C-d>"] = "8j",

		-- Buffer切换
		["<S-e>"] = ":BufferPrevious<CR>",
		["<S-r>"] = ":BufferNext<CR>",
		["<"] = ":BufferMovePrevious<CR>",
		[">"] = ":BufferMoveNext<CR>",

    -- 跳到行首行尾
    ["<C-a>"] = "^",
    ["<C-e>"] = "$",

		-- 文本上下移动
		["<A-j>"] = ":m .+1<CR>==",
		["<A-k>"] = ":m .-2<CR>==",

		-- 快速反义单词
		["<leader>s"] = ":Switch<CR>",

		-- 保存当前文件
		["<C-s>"] = ":w<CR>",

		-- 复制当前文件所有内容
		["<C-c>"] = ":%y+ <CR>",

		-- 关闭高亮搜索
		["<ESC>"] = ":nohlsearch<CR>",

    -- 切换 header/source 文件
    -- ["<A-o>"] = ":ClangdSwitchSourceHeader<CR>",
    ["<A-o>"] = ":SwitchSourceAndHeader<CR>",

		-- 调试相关
		["<F8>"] = ":lua require'dap'.toggle_breakpoint(); require'conf.dap-util'.store_breakpoints(true)<CR>",
		["<leader>b"] = ":lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>",
		["<F6>"] = ":lua require'dap'.terminate()<CR>",
		["<F5>"] = ":lua require'dap'.continue()<CR>",
		["<F9>"] = ":lua require'dap'.step_over()<CR>",
		["<F10>"] = ":lua require'dap'.step_into()<CR>",
		["<F11>"] = ":lua require'dap'.step_out()<CR>",
		["K"] = ":lua require'dapui'.eval()<CR>",

		-- 快速跳转
		["<leader>w"] = ":HopWord<CR>",
		["<leader>l"] = ":HopLine<CR>",
		["<leader>c"] = ":HopChar1<CR>",

		-- Code Run
		["<leader>r"] = ":RunCode<CR>",
		["<leader>rc"] = ":RunClose<CR>",

    -- 快速生成静态变量和函数定义
    ["<leader>df"] = ":ImplementInSource<CR>",
    ["<leader>dv"] = ":ImplementOutOfClass<CR>",
	},

	term_mode = {
		-- 终端窗口间移动
		["<C-h>"] = "<C-\\><C-N><C-w>h",
		["<C-j>"] = "<C-\\><C-N><C-w>j",
		["<C-k>"] = "<C-\\><C-N><C-w>k",
		["<C-l>"] = "<C-\\><C-N><C-w>l",
	},

	visual_mode = {
		-- 缩进
		["<"] = "<gv",
		[">"] = ">gv",

    -- 跳到行首行尾
    ["<C-a>"] = "^",
    ["<C-e>"] = "$",

    ["<leader>df"] = ":lua require('cppassist').ImplementInSourceInVisualMode()<CR>",
	},

	visual_block_mode = {
		-- 文本上下移动
		["<A-j>"] = ":m '>+1<CR>==gv-gv",
		["<A-k>"] = ":m '<-2<CR>==gv-gv",

		["<A-/>"] = ":CommentToggle<CR>",

    ["<leader>df"] = ":lua require('cppassist').ImplementInSourceInVisualMode()<CR>",
	},
	command_mode = {
		-- 命令补全移动选项
		["<Tab>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
		["<S-Tab>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
	},
}

for mode, mapping in pairs(defaults) do
	mode = mode_adapters[mode] or mode
	for key, val in pairs(mapping) do
		local opt = generic_opts[mode] or generic_opts_any
		if type(val) == "table" then
			opt = val[2]
			val = val[1]
		end
		if val then
			vim.keymap.set(mode, key, val, opt)
		else
			pcall(vim.api.nvim_del_keymap, mode, key)
		end
	end
end
