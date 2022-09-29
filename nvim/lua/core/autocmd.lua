local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 退出 neovim 时恢复光标为垂直光标
-- NOTE: VimSuspend
local cursorGrp = augroup("RestroeCursorShapeOnExit", { clear = true })
autocmd("VimLeave", {
	pattern = "*",
	command = "set guicursor=a:ver25",
	group = cursorGrp,
})

-- 进入插入模式时自动切换中文输入法
-- local methodGrp = augroup("AutoSwitchInputMethod", { clear = true })
-- autocmd("InsertEnter", {
-- 	pattern = "*",
-- 	command = 'silent exec "!(/mnt/e/Software/im-select/im-select.exe 2052) &"',
-- 	group = methodGrp,
-- })
--
-- -- 进入VIM时自动切换英文输入法
-- autocmd("VimEnter", {
-- 	pattern = "*",
-- 	command = 'silent exec "!(/mnt/e/Software/im-select/im-select.exe 1033) &"',
-- 	group = methodGrp,
-- })

-- 欢迎界面关闭状态栏
autocmd("FileType", {
	pattern = { "alpha" },
	callback = function()
		vim.opt.laststatus = 0
	end,
})

autocmd("BufUnload", {
	buffer = 0,
	callback = function()
		vim.opt.laststatus = 3
	end,
})

-- 关闭新行自动注释
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- 复制时高亮
local yankGrp = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- 保存时自动格式化
-- local formatGrp = augroup("FormatAutogroup", { clear = true })
-- autocmd("BufWritePost", {
-- 	command = "FormatWrite",
-- 	group = formatGrp,
-- })

-- 自动编译插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
