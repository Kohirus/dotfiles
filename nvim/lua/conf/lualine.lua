-- https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("Not found lualine plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- ====================== 文件诊断组件 =======================
local diagnostics = {
	"diagnostics",
	-- 诊断源: nvim_lsp, nvim_diagnostic, coc, ale, vim_lsp
	soruce = { "nvim_diagnostic" },
	-- 诊断类型: error, warn, info, hint
	sections = { "error", "warn" },
	-- 诊断符号
	symbols = { error = " ", warn = " " },
	-- 显示诊断状态颜色
	colored = true,
	-- 诊断色彩
	diagnostics_color = {
		error = { fg = "#ff6b81" },
		warn = { fg = "#f1c40f" },
	},
	-- 插入模式下更新诊断
	update_in_insert = false,
	-- 是否总是显示
	always_visible = true,
}

-- ===================== 文件差异组件 =======================
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local diff = {
	"diff",
	colored = true,
	symbols = { added = "  ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = "#2ed573" },
		modified = { fg = "#eccc68" },
		removed = { fg = "#ff6b81" },
	},
	cond = hide_in_width,
	source = diff_source,
}

-- ====================== 文件名组件 ========================
local file_name = {
	"filename",
	-- 文件状态: 只读、修改
	file_status = true,
	-- 文件路径: 0--(只显示文件名) 1--(相对路径) 2--(绝对路径) 3--(绝对路径 且主目录使用波浪号)
	path = 1,
	-- 缩短路径空间以为其他组件预留足够空间
	shorting_target = 40,
	symbols = {
		modified = "[+]", -- 修改
		readonly = "[-]", -- 只读
		unnamed = "[No Name]", -- 未命名
	},
}

-- ====================== Git 分支组件 ======================
local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	color = { fg = "#70a1ff" },
}

-- ======================= 文件进度组件 =====================
local progress = {
	"progress",
	color = { fg = "#55efc4" },
}

-- ======================= Spcae 组件 =======================
-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

-- ==========================================================
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "horizon", --"auto",
		component_separators = "|",
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		section_separators = "",
		-- 特定文件类型禁用lualine
		disabled_filetypes = { "alpha", "NvimTree", "Outline", "spectre_panel", "packer" },
		-- 设置为true时 即使右部分不存在 左部分都无法占据整个状态栏空间
		always_divide_middle = true,
	},
	sections = {
		-- lualine_a = { "mode", { separator = { right = "" }, right_padding = 2 } },
		lualine_a = { "mode" },
		lualine_b = { branch, diagnostics },
		lualine_c = { file_name },
		lualine_x = { diff, "filetype" },
		lualine_y = { progress },
		-- lualine_z = { "location", { separator = { left = "" }, left_padding = 0 } },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { file_name },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
