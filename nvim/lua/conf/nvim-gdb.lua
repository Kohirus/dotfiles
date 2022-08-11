-- https://github.com/sakhnik/nvim-gdb

vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_use_cmake_to_find_executables = 0
    let w:nvimgdb_termwin_command = "rightbelow vnew"
    let w:nvimgdb_codewin_command = "vnew"
    let g:nvimgdb_config_override = {
      \ 'key_next': '-n',
      \ 'key_step': '-s',
      \ 'key_finish': '-f',
      \ 'key_continue': '-c',
      \ 'key_until': '-u',
      \ 'key_breakpoint': '-b',
  \ }
]])

_G.GdbSessionInit = function()
	-- restore breakpoints if possible
	local utils = require("core.utils")
	if utils.exists(".bps.txt") then
		vim.defer_fn(function()
			vim.api.nvim_command(":Gdb source .bps.txt")
		end, 300)
	end

	-- create bt & info locals window
	vim.api.nvim_command(":belowright GdbCreateWatch thread apply all bt")
	vim.api.nvim_command(":wincmd h")
	vim.api.nvim_command(":belowright GdbCreateWatch info locals")

	-- move cursor back to gdb terminal
	vim.api.nvim_command(":wincmd k")
end

_G.StartGdbSession = function()
	-- start gdb sessoin
	local exec_file = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	vim.api.nvim_command(":GdbStart gdb -q " .. exec_file)
end

_G.CreateWatch = function()
	local watch_arg = vim.fn.input("Watch cmd: ")
	vim.api.nvim_command(":GdbCreateWatch " .. watch_arg)
end

_G.CloseWatchBuffers = function()
	vim.defer_fn(function()
		vim.api.nvim_command(":bd! thread info")
	end, 10)
end

vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>GdbStart gdbr<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>lua StartGdbSession()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>lua CreateWatch()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>dbt", "<cmd>GdbLopenBacktrace<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>dbp", "<cmd>GdbLopenBreakpoints<cr>", {})

vim.cmd([[
  autocmd User NvimGdbStart :lua GdbSessionInit()
  autocmd User NvimGdbCleanup :lua CloseWatchBuffers()
]])
