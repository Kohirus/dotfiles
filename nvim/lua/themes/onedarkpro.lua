-- https://github.com/olimorris/onedarkpro.nvim

local onedarkpro = prequire("onedarkpro")
if not onedarkpro then
	return
end

onedarkpro.setup({
	-- Or "onelight", "onedark_vivid", "onedark_dark"
	dark_theme = "onedark_vivid", -- The default dark theme
	light_theme = "onelight", -- The default light theme
	plugins = {
		toggleterm = false,
	},
	styles = {
		strings = "NONE", -- Style that is applied to strings
		comments = "NONE", -- Style that is applied to comments
		keywords = "bold,italic", -- Style that is applied to keywords
		functions = "NONE", -- Style that is applied to functions
		variables = "NONE", -- Style that is applied to variables
		virtual_text = "italic", -- Style that is applied to virtual text
	},
	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = false, -- Use the themes opinionated underline styles?
		undercurl = false, -- Use the themes opinionated undercurl styles?
		cursorline = true, -- Use cursorline highlighting?
		transparency = false, -- Use a transparent background?
		terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
		window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
	},
})

onedarkpro.load()
