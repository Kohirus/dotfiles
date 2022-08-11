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

-- 显示 lsp 加载进度
local client_notifs = {}
augroup("lsp_notify", { clear = true }) -- create augroup
autocmd("User", {
	pattern = "LspProgressUpdate", -- LSP Progress Update autocommand
	group = "lsp_notify",
	desc = "LSP progress notification",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf() -- get buffer number
		for _, client in pairs(vim.lsp.buf_get_clients()) do -- loop over each client to check notifications
			if not client_notifs[bufnr] then -- create buffer specific notification table if not exists
				client_notifs[bufnr] = {}
			end
			if not client_notifs[bufnr][client.id] then -- create buffers client  specific  notification table if not exists
				client_notifs[bufnr][client.id] = {}
			end
			local notif_data = client_notifs[bufnr][client.id] -- set notif_data variable
			local progress = nil
			for _, progress_msg in pairs(client.messages.progress) do
				progress = true -- expose if a progress exists
				if not progress_msg.done then
					progress = progress_msg -- get clients first not done progress messages
					break
				end
			end
			if type(progress) == "table" and progress.percentage and progress.percentage ~= 0 then -- if there is a progress message
				local notify_opts = {} -- define notification options
				local new_msg = notif_data.notification == nil -- if it's a new message set different options
				if new_msg then -- for new messages set a title, initialize icone and disable timeout
					notify_opts = {
						title = client.name .. (#progress.title > 0 and ": " .. progress.title or ""),
						icon = require("core.utils").spinner_frames[1],
						timeout = false,
					}
				else -- for existing messages just update the existing notification
					notify_opts = { replace = notif_data.notification }
				end
				notif_data.notification = vim.notify( -- notify with percentage and message
					(progress.percentage and progress.percentage .. "%\t" or "") .. (progress.message or ""),
					"info",
					notify_opts
				)
				if new_msg then -- if it's a new message, start the update spinner background job
					require("core.utils").update_spinner(notif_data)
				end
			elseif progress and not vim.tbl_isempty(notif_data) then -- if there is finished progress and a notification, complete it
				notif_data.notification =
					vim.notify("Complete", "info", { icon = "", replace = notif_data.notification, timeout = 3000 })
				notif_data = {} -- clear notification data
			end
		end
	end,
})

-- 自动编译插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
