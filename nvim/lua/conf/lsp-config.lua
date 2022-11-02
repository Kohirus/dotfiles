local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keybinds = vim.api.nvim_buf_set_keymap
	-- 异步 lsp 查找
	keybinds(bufnr, "n", "gh", "<cmd>Lspsaga lsp_finder<cr>", opts)
	--  代码行为
	keybinds(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	-- 悬停文档
	keybinds(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	keybinds(bufnr, "n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)
	keybinds(bufnr, "n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
	-- 签名帮助
	keybinds(bufnr, "n", "gs", "<cmd>Lspsaga signature_help<cr>", opts)
	-- 变量重命名
	keybinds(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", opts)
	-- 预览定义
	keybinds(bufnr, "n", "gd", "<cmd>Lspsaga preview_definition<cr>", opts)
	-- 显示代码诊断
	keybinds(bufnr, "n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	-- 诊断跳转
	keybinds(bufnr, "n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	keybinds(bufnr, "n", "g]", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
end

local function highlight(client)
	local present, illuminate = pcall(require, "illuminate")
	if present then
		illuminate.on_attach(client)
	else
		vim.notify("Not found vim illuminate plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
		vim.api.nvim_exec(
			[[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
			false
		)
	end
end

-- 当语言服务器连接到缓冲区时调用该函数
local on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	highlight(client)
	require("lsp_signature").on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lspconfig")["clangd"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})
require("lspconfig")["sumneko_lua"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
	settings = {
		["sumneko_lua"] = {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostic = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		},
	},
})
require("lspconfig")["cmake"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})
