-- https://github.com/terrortylor/nvim-comment

local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
	vim.notify("Not found nvim comment plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

comment.setup({
	-- Linters prefer comment and line to have a space in between markers
	marker_padding = true,
	-- should comment out empty or whitespace only lines
	comment_empty = true,
	-- Should key mappings be created
	create_mappings = true,
	-- Normal mode mapping left hand side
	line_mapping = "gcc",
	-- Visual/Operator mapping left hand side
	operator_mapping = "gc",
	-- Hook function to call before commenting takes place
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "cpp" then -- cutomize difference language comment marker
			vim.api.nvim_buf_set_option(0, "commentstring", "// %s") -- cpp use //
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "c" then
			vim.api.nvim_buf_set_option(0, "commentstring", "/* %s */") -- c use /**/
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "shell" then
			vim.api.nvim_buf_set_option(0, "commentstring", "# %s") -- shell use #
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "lua" then
			vim.api.nvim_buf_set_option(0, "commentstring", "-- %s") -- lua use --
		elseif vim.api.nvim_buf_get_option(0, "filetype") == "cmake" then
			vim.api.nvim_buf_set_option(0, "commentstring", "# %s") -- cmake use #
		end
	end,
})
