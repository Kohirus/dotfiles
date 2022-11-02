-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Not found treesitter plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

treesitter.setup({
	ensure_installed = { "cpp", "c", "make", "json", "html", "css", "lua", "vim", "cmake", "bash", "yaml", "proto" },
	-- 同步安装解析器(仅适用于 ensure_installed 的语言)
	sync_install = false,
	-- 忽略安装
	ignore_install = { "" },
	highlight = {
		enable = true,
		-- 关闭高亮的解析器名 而非文件类型
		disable = { "" },
		-- 关闭 neovim 内置高亮
		additional_vim_regex_highlighting = false,
	},
	-- 文本对象: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		-- 文本交换
		swap = { enable = false },
		-- 文本选择
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		-- 文本移动
		move = {
			enable = true,
			set_jumps = false,
			goto_next_start = { ["]["] = "@function.outer" },
			goto_next_end = { ["]]"] = "@function.outer" },
			goto_previous_start = { ["[["] = "@function.outer" },
			goto_previous_end = { ["[]"] = "@function.outer" },
		},
		-- lsp交互操作
		lsp_interop = { enable = false },
	},
	-- 彩虹括号: https://github.com/p00f/nvim-ts-rainbow
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	-- 范围选择
	incremental_selection = {
		enable = true,
		keymaps = {
			-- 初始化选择
			init_selection = "<CR>",
			-- 递增
			node_incremental = "<CR>",
			-- 递减
			node_decremental = "<BS>",
			-- 选择一个范围
			scope_incremental = "<TAB>",
		},
	},
})
