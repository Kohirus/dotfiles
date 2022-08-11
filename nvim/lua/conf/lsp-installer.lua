-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = prequire("nvim-lsp-installer")
if not lsp_installer then
	return
end

lsp_installer.setup({
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✔️", --" ",
			server_pending = "⌛", --" ",
			server_uninstalled = "💀", --"ﮊ ",
		},
	},
})
