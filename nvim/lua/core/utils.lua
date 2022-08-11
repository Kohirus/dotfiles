_G.warn = function(msg, name)
	vim.notify(msg, vim.log.levels.WARN, { title = name })
end

_G.error = function(msg, name)
	vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

_G.info = function(msg, name)
	vim.notify(msg, vim.log.levels.INFO, { title = name })
end

_G.prequire = function(plugin)
	local status, lib = pcall(require, plugin)
	if status then
		return lib
	else
		warn(plugin .. " not found!", "Plugin Warnning")
	end
	return nil
end

local M = {}

M.SaveAll = function()
	vim.api.nvim_command(":wa")
end

M.Quit = function()
	vim.api.nvim_command(":qa")
end

M.ToggleTheme = function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end

M.exists = function(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

M.spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" } -- spinners

M.update_spinner = function(notif_data)
	-- update spinner helper function to defer
	if notif_data.spinner then
		local new_spinner = (notif_data.spinner + 1) % #spinner_frames
		notif_data.spinner = new_spinner

		notif_data.notification = vim.notify(nil, nil, {
			hide_from_history = true,
			icon = spinner_frames[new_spinner],
			replace = notif_data.notification,
		})

		vim.defer_fn(function()
			update_spinner(notif_data)
		end, 100)
	end
end

return M
