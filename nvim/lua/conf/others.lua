local M = {}

-- https://github.com/williamboman/mason.nvim
M.mason = function()
	local status_ok, mason = pcall(require, "mason")
	if not status_ok then
		vim.notify("Not found mason plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	mason.setup({
		ui = {
			icons = {
				package_installed = "✔️",
				package_pending = "⌛",
				package_uninstalled = "💀",
			},
		},
	})
end

-- https://github.com/williamboman/mason-lspconfig.nvim
M.mason_lspconfig = function()
	local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not status_ok then
		vim.notify("Not found mason_lspconfig plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	mason_lspconfig.setup({
		ensure_installed = { "sumneko_lua", "clangd", "cmake" },
	})
end

-- https://github.com/jayp0521/mason-nvim-dap.nvim
M.mason_dap = function()
	local status_ok, mason_dap = pcall(require, "mason-nvim-dap")
	if not status_ok then
		vim.notify("Not found mason dap plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	mason_dap.setup({
		ensure_installed = { "cpptools" },
	})
end

-- https://github.com/brglng/vim-im-select
M.im_select = function()
	vim.g.im_select_command = "/mnt/e/Software/im-select/im-select.exe"
	vim.g.im_select_default = "1033"
	vim.g.im_select_enable_focus_events = 0
end

-- https://github.com/m-demare/hlargs.nvim
M.hlargs = function()
	local status_ok, hlargs = pcall(require, "hlargs")
	if not status_ok then
		vim.notify("Not found hlargs plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	hlargs.setup()
end

-- https://github.com/kevinhwang91/nvim-hlslens
M.hlslens = function()
	local status_ok, hlslens = pcall(require, "hlslens")
	if not status_ok then
		vim.notify("Not found hlslens plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	hlslens.setup()

	local kopts = { noremap = true, silent = true }
	local keybinds = vim.api.nvim_set_keymap

	keybinds("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
	keybinds("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
	keybinds("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	keybinds("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	keybinds("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	keybinds("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
end

-- https://github.com/windwp/nvim-autopairs
M.autopairs = function()
	local status_ok_auto, autopairs = pcall(require, "nvim-autopairs")
	local status_ok_cmp, cmp = pcall(require, "cmp")
	if not (status_ok_auto and status_ok_cmp) then
		vim.notify("Not found autopairs plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	autopairs.setup()

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

-- https://github.com/norcalli/nvim-colorizer.lua
M.colorizer = function()
	local status_ok, colorizer = pcall(require, "colorizer")
	if not status_ok then
		vim.notify("Not found colorizer plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	colorizer.setup()
end

-- https://github.com/nvim-pack/nvim-spectre
M.spectre = function()
	local status_ok, spectre = pcall(require, "spectre")
	if not status_ok then
		vim.notify("Not found spectre plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	spectre.setup()
end

-- LuaSnip:   https://github.com/saadparwaiz1/cmp_luasnip
-- friendly-snippets: https://github.com/rafamadriz/friendly-snippets
M.luasnip = function()
	local status_ok, luasnip = pcall(require, "luasnip")
	if not status_ok then
		vim.notify("Not found LuaSnip plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	local options = {
		history = true,
		updateevents = "TextChanged,TextChangedI",
	}

	luasnip.config.set_config(options)
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if
				require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require("luasnip").session.jump_active
			then
				require("luasnip").unlink_current()
			end
		end,
	})
end

-- https://github.com/AndrewRadev/switch.vim
M.switch = function()
	-- 反义单词组
	local switch_words = {
		{ "true", "false" },
		{ "on", "off" },
		{ "yes", "no" },
		{ "disable", "enable" },
		{ "+", "-" },
		{ ">", "<" },
		{ ">=", "<=" },
		{ "==", "!=" },
		{ "&&", "||" },
	}

	-- 反义单词容器
	local push_words = {}

	for _, value in pairs(switch_words) do
		local w1, w2 = value[1], value[2]
		-- 全小写
		table.insert(push_words, value)
		-- 全大写
		table.insert(push_words, { string.upper(w1), string.upper(w2) })
		-- 首字母大写
		w1, _ = string.gsub(w1, "^%l", string.upper)
		w2, _ = string.gsub(w2, "^%l", string.upper)
		table.insert(push_words, { w1, w2 })
	end

	vim.g.switch_custom_definitions = push_words
end

-- https://github.com/phaazon/hop.nvim
M.hop = function()
	local status_ok, hop = pcall(require, "hop")
	if not status_ok then
		vim.notify("Not found hop plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end

	hop.setup({ keys = "etovxqpdygfblzhckisuran" })
end

-- https://github.com/folke/todo-comments.nvim
M.todo_comments = function()
	local status_ok, todo_comments = pcall(require, "todo-comments")
	if not status_ok then
		vim.notify("Not found todo comments plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end
	todo_comments.setup({
		keywords = {
			FIX = {
				icon = " ",
				color = "#DC2626",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" },
			},
			TODO = { icon = " ", color = "#2563EB" },
			HACK = { icon = " ", color = "#7C3AED" },
			WARN = { icon = " ", color = "#FBBF24", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", color = "#FC9868", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } },
		},
	})
end

-- https://github.com/mbbill/undotree
M.undotree = function()
	vim.cmd([[
      if has("persistent_undo")
        " 在 config.lua 中定义好了 undotree_dir 全局变量
        let target_path = expand(undotree_dir)
      if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
      endif
      let &undodir = target_path
      set undofile
    ]])
end

-- https://github.com/ethanholz/nvim-lastplace
M.lastplace = function()
	local status_ok, lastplace = pcall(require, "nvim-lastplace")
	if not status_ok then
		vim.notify("Not found lastplace plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		return
	end
	lastplace.setup({
		lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
		lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
		lastplace_open_folds = true,
	})
end

return M
