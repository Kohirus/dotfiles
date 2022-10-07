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
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "NONE" },
		conditionals = { "italic" },
		loops = {},
		functions = { },
		keywords = { "bold" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		cmp = true,
		gitsigns = true,
		telescope = true,
		nvimtree = true,
    barbar = true,
    hop = true,
    lsp_saga = true,
    notify = true,
    treesitter_context = true,
    ts_rainbow = true,
    symbols_outline = true,
    illuminate = true,
    which_key = true,
	},
	color_overrides = {},
	highlight_overrides = {},
})

-- vim.cmd([[colorscheme catppuccin]])
