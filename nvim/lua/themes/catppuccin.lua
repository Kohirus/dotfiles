-- https://github.com/catppuccin/nvim

local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	vim.notify("Not found catppuccin theme!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

-- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = "frappe"

catppuccin.setup({
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "NONE",
		conditionals = "NONE",
		loops = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "NONE",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = false,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		hop = true,
		notify = true,
		telekasten = true,
		symbols_outline = true,
	},
})

vim.cmd([[colorscheme catppuccin]])
