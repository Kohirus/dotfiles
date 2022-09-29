-- https://github.com/mhartington/formatter.nvim

local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	vim.notify("Not found alpha plugin!", vim.log.levels.WARN, { title = "Plugin Warning" })
	return
end

local util = require("formatter.util")

local style = [[-style="{
  BasedOnStyle: WebKit,
  SortIncludes: false,
  AlignConsecutiveMacros: true,
  AlignConsecutiveAssignments: true,
  AlignConsecutiveDeclarations: true,
  AllowShortFunctionsOnASingleLine: true,
  AlignTrailingComments: true,
  BreakBeforeBraces: Attach,
}"]]

-- NOTE: need to install format program
-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
formatter.setup({
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			-- Pick from defaults
			require("formatter.filetypes.lua").stylua,
		},
		-- clangformat格式化选项: https://clang.llvm.org/docs/ClangFormatStyleOptions.html#
		-- 配置参考: https://blog.csdn.net/mingshili/article/details/120576171
		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						style,
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					-- try_node_modules = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						style,
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
					-- try_node_modules = true,
				}
			end,
		},
	},
})
