-- https://github.com/CRAG666/code_runner.nvim

local code_runner = prequire("code_runner")
if not code_runner then
	return
end

code_runner.setup({
	-- choose default mode (valid term, tab, float, toggle)
	mode = "term",
	-- Focus on runner window(only works on toggle, term and tab mode)
	focus = true,
	-- startinsert (see ':h inserting-ex')
	startinsert = false,
	term = {
		--  Position to open the terminal, this option is ignored if mode is tab
		position = "bot",
		-- window size, this option is ignored if tab is true
		size = 8,
	},
	float = {
		-- Window border (see ':h nvim_open_win')
		border = "none",

		-- Num from `0 - 1` for measurements
		height = 0.8,
		width = 0.8,
		x = 0.5,
		y = 0.5,

		-- Highlight group for floating window/border (see ':h winhl')
		border_hl = "FloatBorder",
		float_hl = "Normal",

		-- Transparency (see ':h winblend')
		blend = 0,
	},
	filetype = {
		c = "cd $dir && g++ $fileName -g -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		cpp = "cd $dir && g++ $fileName -g -o $fileNameWithoutExt && ./$fileNameWithoutExt",
	},
})
