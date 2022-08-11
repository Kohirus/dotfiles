-- nvim-cmp:  https://github.com/hrsh7th/nvim-cmp
-- LuaSnip:   https://github.com/saadparwaiz1/cmp_luasnip
-- buffer:    https://github.com/hrsh7th/cmp-buffer
-- nvim_lsp:  https://github.com/hrsh7th/cmp-nvim-lsp
-- path:      https://github.com/hrsh7th/cmp-path
-- cmdline:   https://github.com/hrsh7th/cmp-cmdline
-- tabnine:   https://github.com/tzachar/cmp-tabnine
-- nvim_lua:  https://github.com/hrsh7th/cmp-nvim-lua

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
	local luasnip = prequire("luasnip")
	if not luasnip then
		return
	end

	local win_get_cursor = vim.api.nvim_win_get_cursor
	local get_current_buf = vim.api.nvim_get_current_buf

	local function inside_snippet()
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
		return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
	end

	---sets the current buffer's luasnip to the one nearest the cursor
	---@return boolean true if a node is found, false otherwise
	local function seek_luasnip_cursor_node()
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1
		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snippet = node.parent.snippet
		local exit_node = snippet.insert_nodes[0]

		-- exit early if we're past the exit node
		if exit_node then
			local exit_pos_end = exit_node.mark:pos_end()
			if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		node = snippet.inner_first:jump_into(1, true)
		while node ~= nil and node.next ~= nil and node ~= snippet do
			local n_next = node.next
			local next_pos = n_next and n_next.mark:pos_begin()
			local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
				or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

			-- Past unmarked exit node, exit early
			if n_next == nil or n_next == snippet.next then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end

			if candidate then
				luasnip.session.current_nodes[get_current_buf()] = node
				return true
			end

			local ok
			ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
			if not ok then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		-- No candidate, but have an exit node
		if exit_node then
			-- to jump to the exit node, seek to snippet
			luasnip.session.current_nodes[get_current_buf()] = snippet
			return true
		end

		-- No exit node, exit from snippet
		snippet:remove_from_jumplist()
		luasnip.session.current_nodes[get_current_buf()] = nil
		return false
	end

	if dir == -1 then
		return inside_snippet() and luasnip.jumpable(-1)
	else
		return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
	end
end

---checks if emmet_ls is available and active in the buffer
---@return boolean true if available, false otherwise
local is_emmet_active = function()
	local clients = vim.lsp.buf_get_clients()

	for _, client in pairs(clients) do
		if client.name == "emmet_ls" then
			return true
		end
	end
	return false
end

local cmp = prequire("cmp")
if not cmp then
	return
end

local luasnip = prequire("luasnip")
if not luasnip then
	return
end

-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- load custom snippets
-- NOTE: Add your snippets
--[[require("luasnip.loaders.from_vscode").load({ paths = {
  vim.fn.stdpath("config") .. "/snippets"
} }) -- Load snippets from snippets folder]]

cmp_config = {
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	completion = {
		---@usage The minimum length of a word to complete on.
		keyword_length = 1,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif jumpable(1) then
				luasnip.jump(1)
			elseif check_backspace() then
				fallback()
			elseif is_emmet_active() then
				return vim.fn["cmp#complete"]()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-p>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Up>"] = cmp.mapping.abort(),
		["<Down>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() and cmp.confirm(cmp_config.confirm_opts) then
				if jumpable(1) then
					luasnip.jump(1)
				end
				return
			end

			if jumpable(1) then
				if not luasnip.jump(1) then
					fallback()
				end
			else
				fallback()
			end
		end),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		max_width = 0,
		kind_icons = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "ﰠ",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		},
		source_names = {
			nvim_lsp = "(LSP)",
			path = "(Path)",
			cmp_tabnine = "(Tabnine)",
			luasnip = "(Snippet)",
			buffer = "(Buffer)",
			nvim_lua = "(Nvim)",
		},
		duplicates = {
			buffer = 1,
			path = 1,
			nvim_lsp = 0,
			luasnip = 1,
		},
		duplicates_default = 0,
		format = function(entry, vim_item)
			local max_width = cmp_config.formatting.max_width
			if max_width ~= 0 and #vim_item.abbr > max_width then
				vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
			end
			vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
			vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
			vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
				or cmp_config.formatting.duplicates_default
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "cmp_tabnine" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
	},
}

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline("?", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "cmdline" },
	}, {
		{ name = "path" },
	}),
})

cmp.setup(cmp_config)

-- 选择 function 或 method 后自动补全括号
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
