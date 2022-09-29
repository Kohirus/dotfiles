-- https://github.com/tami5/lspsaga.nvim

local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	vim.notify("Not found lspsaga plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

lspsaga.setup({ -- defaults ...
	debug = false,
	use_saga_diagnostic_sign = true,
	-- diagnostic sign
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "🐞", --"   ",
	-- code action title icon
	code_action_icon = "💡", --" ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "💫 ", --"  ",
	finder_reference_icon = "💫 ", --"  ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "<ESC>",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<ESC>",
		exec = "<CR>",
	},
	definition_preview_icon = "🧭 ", --"  ",
	border_style = "single",
	rename_prompt_prefix = "➤",
	rename_output_qflist = {
		enable = false,
		auto_open_qflist = false,
	},
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = false,
})
