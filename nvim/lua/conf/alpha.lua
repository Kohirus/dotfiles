-- https://github.com/goolord/alpha-nvim

local status_ok, alpha = pcall(require,"alpha")
if not status_ok then
	vim.notify("Not found alpha plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "🔎  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "⌚  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("p", "💻  Select project", ":Telescope projects <CR>"),
	dashboard.button("t", "🔖  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "📦  Configuration", ":e ~/.config/nvim/lua/core/plugins.lua <CR>"),
	dashboard.button("q", "🏃  Quit Neovim", ":qa<CR>"),
}

local function footer()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date("%Y-%m-%d 🕔 %H:%M:%S")
	local plugins_text = "\t" .. total_plugins .. " plugins 🐱  " .. datetime
	return plugins_text
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Function"
dashboard.section.buttons.opts.hl_shortcut = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
