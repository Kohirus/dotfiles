-- https://github.com/folke/which-key.nvim

local which_key = prequire("which-key")
if not which_key then
	return
end

which_key.setup({
	plugins = {
		marks = false, -- 显示标记
		registers = true, -- 显示 normal 模式或 insert 模式下的登记表
		spellings = {
			enabled = false, -- 如果为true，则在按下 z= 去选择拼写建议时显示 WhichKey
			suggestions = 20, -- 列表中显示的条目数目
		},
		-- presets 插件
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = true,
			nav = true,
			z = false,
			g = false,
		},
	},
	key_labels = {
		-- 覆盖用于显示某些键的标签 它不会以任何其他方式影响WK
	},
	icons = {
		breadcrumb = "»", -- 命令行区的符号
		separator = "➜", -- 用于关键字和标签之间
		group = "+", -- 群组符号
	},
	popup_mappings = {
		scroll_down = "<C-d>", -- 在弹出窗口中向下滚动
		scroll_up = "<C-u>", -- 在弹出窗口中向上滚动
	},
	window = {
		border = "rounded", -- none signle double shadow
		position = "bottom", -- bottom top
		margin = { 1, 0, 1, 0 }, -- 额外的窗口边距 top, right, bottom, right
		padding = { 2, 2, 2, 2 }, -- 额外的窗口填充 top, right, bottom, left
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- 列的最小高度和最大高度
		width = { min = 25, max = 60 }, -- 列的最小宽度的最大宽度
		spacing = 8, -- 列之间的空隙
		align = "left", -- 列对齐方式: left right center
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true, -- 当弹出窗口可见时在命令区显示帮助信息
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

-- 基本设置
local opts = {
	mode = "n", -- normal 模式
	prefix = "<Space>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

-- 按键映射
local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Main Menu" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
	["q"] = { "<cmd>lua require('core.utils').Quit()<cr>", "Quit" },
	["w"] = { "<cmd>lua require('core.utils').SaveAll()<cr>", "Save All" },
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	["u"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
	["x"] = { "<cmd>BufferClose<CR>", "Close Buffer" },
	["r"] = { "<cmd>Lspsaga rename<cr>", "Rename" },
	["t"] = { "<cmd>lua require('core.utils').ToggleTheme()<cr>", "Toggle Theme" },
	["f"] = { "<cmd>FormatWrite<cr>", "Formatter" },

	b = {
		name = "Buffer",
		q = { "<cmd>BufferAllButCurrent<CR>", "Close Other" },
		p = { "<cmd>BufferPin<CR>", "Toggle Pin" },
		l = { "<cmd>BufferCloseBuffersLeft<CR>", "Close Left" },
		r = { "<cmd>BufferCloseBuffersRight<CR>", "Close Right" },
		j = { "<cmd>BufferPick<CR>", "Jump Buffer" },
		P = { "<cmd>BufferCloseAllButPinned<CR>", "Close But Pin" },
		c = { "<cmd>BufferCloseButCurrentOrPinned<CR>", "Close No Label" },
	},

	s = {
		name = "Search",
		r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
		t = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
		s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
		S = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "Workspace Symbols" },
		d = { "<cmd>TodoTelescope<CR>", "Todo List" },
	},

	c = {
		name = "Code",
		a = { "<cmd>Lspsaga code_action<cr>", "Code Actions" },
		r = { "<cmd>Telescope lsp_references<cr>", "Reference" },
		e = { "<cmd>Telescope diagnostics theme=dropdown<cr>", "Workspace Error" },
		h = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
		s = { "<cmd>Lspsaga signature_help<cr>", "Signature" },
		p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
		f = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Define" },
		i = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
		o = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" },
	},

	d = {
		name = "Debug",
		c = { "<cmd>lua require('dap').run_to_cursor()<CR>", "Run to Cursor" },
		e = { "<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ')<CR>", "Evalute Input" },
		x = { "<cmd>lua require('dap').terminate()<CR>", "Stop Debug" },
		s = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle Panel" },
		p = { "<cmd>lua require('dap').pause()<CR>", "Pause" },
		r = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle Repl" },
	},

	i = {
		name = "Install",
		s = { "<cmd>PackerSync<cr>", "Packer Sync" },
		t = { "<cmd>PackerStatus<cr>", "Packer Status" },
		n = { "<cmd>PackerInstall<cr>", "Packer Install" },
		c = { "<cmd>PackerClean<cr>", "Packer Clean" },
		p = { "<cmd>PackerProfile<cr>", "Packer Profile" },
		l = { "<cmd>LspInstallInfo<cr>", "Install Lsp" },
		i = { "<cmd>LspInfo<cr>", "Lsp Info" },
	},

	p = {
		name = "Replace",
		p = { "<cmd>lua require('spectre').open()<CR>", "Open Panel" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Current Word" },
		f = { "<cmd>lua require('spectre').open_file_search()<CR>", "Current File" },
	},

	g = {
		name = "Git",
		f = { "<cmd>DiffviewFileHistory<CR>", "File History" },
		p = { "<cmd>DiffviewOpen<CR>", "Diff Project" },
		n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		N = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		U = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},

	h = {
		name = "Help",
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notify History" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		d = { "<cmd>Telescope commands<cr>", "Commands" },
	},
}

which_key.register(mappings, opts)
