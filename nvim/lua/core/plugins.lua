-- packer 管理器: https://github.com/wbthomason/packer.nvim
-- 优秀插件地址: https://github.com/askfiy/awesome-neovim

local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	print("Cloning packer ...")
	---@diagnostic disable-next-line: lowercase-global
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	auto_clean = true,
	ensure_installed = true,
	display = {
		working_sym = "⌛", --" ﲊ",
		error_sym = "💀", --"✗ ",
		done_sym = "✔️", --" ",
		removed_sym = "❌", --" ",
		moved_sym = "🔧", --"",
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	profile = {
		enable = true,
		threshold = 0,
	},
})

local plugins = {
	["wbthomason/packer.nvim"] = {},

	["nvim-lua/plenary.nvim"] = {},
	["kyazdani42/nvim-web-devicons"] = { module = "nvim-web-devicons" },
	["nvim-lua/popup.nvim"] = { module = "popup.nvim" },

	["rcarriga/nvim-notify"] = {
		config = function()
			require("conf.nvim-notify")
		end,
	},

	-- colorscheme
	["olimorris/onedarkpro.nvim"] = {
		config = function()
			require("themes.onedarkpro")
		end,
	},
	["catppuccin/nvim"] = {
		as = "catppuccin",
		config = function()
			require("themes.catppuccin")
		end,
		disable = true,
	},
	["glepnir/zephyr-nvim"] = { disable = true },

	["goolord/alpha-nvim"] = {
		after = "onedarkpro.nvim",
		config = function()
			require("conf.alpha")
		end,
	},

	-- lsp
	["williamboman/mason.nvim"] = {
		config = function()
			require("conf.others").mason()
		end,
	},

	["williamboman/mason-lspconfig.nvim"] = {
		after = "mason.nvim",
		config = function()
			require("conf.others").mason_lspconfig()
		end,
	},

	["ray-x/lsp_signature.nvim"] = {
		after = "mason-lspconfig.nvim",
		config = function()
			require("conf.lsp-signature")
		end,
	},

	["kkharji/lspsaga.nvim"] = {
		after = "lsp_signature.nvim",
		config = function()
			require("conf.lspsaga")
		end,
	},

	["RRethy/vim-illuminate"] = {
		after = "lspsaga.nvim",
	},

	["neovim/nvim-lspconfig"] = {
		after = "vim-illuminate",
		module = "lspconfig",
		config = function()
			require("conf.lsp-config")
		end,
	},

	-- cmp
	["rafamadriz/friendly-snippets"] = {
		module = "cmp_nvim_lsp",
		event = "InsertEnter",
	},

	["hrsh7th/nvim-cmp"] = {
		after = "friendly-snippets",
		config = function()
			require("conf.nvim-cmp")
		end,
	},

	["L3MON4D3/LuaSnip"] = {
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("conf.others").luasnip()
		end,
	},

	["saadparwaiz1/cmp_luasnip"] = {
		after = "LuaSnip",
	},

	["hrsh7th/cmp-nvim-lua"] = {
		after = "cmp_luasnip",
	},

	["hrsh7th/cmp-nvim-lsp"] = {
		after = "cmp-nvim-lua",
	},

	["hrsh7th/cmp-buffer"] = {
		after = "cmp-nvim-lsp",
	},

	["hrsh7th/cmp-path"] = {
		after = "cmp-buffer",
	},

	["hrsh7th/cmp-cmdline"] = {
		after = "cmp-path",
	},

	["windwp/nvim-autopairs"] = {
		after = "nvim-cmp",
		config = function()
			require("conf.others").autopairs()
		end,
	},

	["tzachar/cmp-tabnine"] = {
		after = "cmp-cmdline",
		run = "./install.sh",
	},

	["mhartington/formatter.nvim"] = {
		opt = true,
		cmd = require("core.lazy_load").formatter_cmds,
		setup = function()
			require("core.lazy_load").on_file_open("formatter.nvim")
		end,
		config = function()
			require("conf.formatter")
		end,
	},

	["terrortylor/nvim-comment"] = {
		opt = true,
		keys = require("core.lazy_load").comments_keys,
		cmd = { "CommentToggle", "'<,'>CommentToggle" },
		config = function()
			require("conf.nvim-comment")
		end,
	},

	-- treesitter
	["nvim-treesitter/nvim-treesitter"] = {
		module = "nvim-treesitter",
		setup = function()
			require("core.lazy_load").on_file_open("nvim-treesitter")
		end,
		cmd = require("core.lazy_load").treesitter_cmds,
		run = ":TSUpdate",
		config = function()
			require("conf.treesitter")
		end,
	},

	["nvim-treesitter/nvim-treesitter-context"] = {
		after = "nvim-treesitter",
		config = function()
			require("conf.treesitter-context")
		end,
	},

	["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

	["m-demare/hlargs.nvim"] = {
		after = "nvim-ts-rainbow",
		config = function()
			require("conf.others").hlargs()
		end,
	},

	["kyazdani42/nvim-tree.lua"] = {
		cmd = { "NvimTreeToggle", "NvimTreeFocuse" },
		config = function()
			require("conf.nvim-tree")
		end,
		tag = "nightly",
	},

	["romgrk/barbar.nvim"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("barbar.nvim")
		end,
		config = function()
			require("conf.barbar")
		end,
	},

	["nvim-lualine/lualine.nvim"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("lualine.nvim")
		end,
		config = function()
			require("conf.lualine")
		end,
	},

	["folke/which-key.nvim"] = {
		keys = { "<space>" },
		config = function()
			require("conf.which-key")
		end,
	},

	["nvim-telescope/telescope-fzf-native.nvim"] = {
		run = "make",
		module = "telescope",
		cmd = { "Telescope", "TodoTelescope" },
	},

	["nvim-telescope/telescope-ui-select.nvim"] = { after = "telescope-fzf-native.nvim" },

	["nvim-telescope/telescope-live-grep-args.nvim"] = { after = "telescope-ui-select.nvim" },

	["nvim-telescope/telescope.nvim"] = {
		after = "telescope-live-grep-args.nvim",
		config = function()
			require("conf.telescope")
		end,
	},

	["norcalli/nvim-colorizer.lua"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").colorizer()
		end,
		config = function()
			require("conf.others").colorizer()
		end,
	},

	["windwp/nvim-spectre"] = {
		module = "spectre",
		config = function()
			require("conf.others").spectre()
		end,
	},

	["kevinhwang91/nvim-hlslens"] = {
		keys = require("core.lazy_load").hlslens_keys,
		config = function()
			require("conf.others").hlslens()
		end,
	},

	["AndrewRadev/switch.vim"] = {
		opt = true,
		cmd = { "Switch" },
		config = function()
			require("conf.others").switch()
		end,
	},

	["mbbill/undotree"] = {
		opt = true,
		cmd = { "UndotreeToggle" },
		config = function()
			require("conf.others").undotree()
		end,
	},

	["folke/todo-comments.nvim"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").todo_comments()
		end,
		config = function()
			require("conf.others").todo_comments()
		end,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("indent-blankline.nvim")
		end,
		config = function()
			require("conf.indent-blankline")
		end,
	},

	["simrat39/symbols-outline.nvim"] = {
		opt = true,
		cmd = "SymbolsOutline",
		config = function()
			require("conf.symbol-outline")
		end,
	},

	["akinsho/toggleterm.nvim"] = {
		opt = true,
		keys = { "<C-\\>", "<Space>l" },
		module = "toggleterm.nvim",
		config = function()
			require("conf.toggleterm")
		end,
	},

	["lewis6991/gitsigns.nvim"] = {
		opt = true,
		module = "gitsigns",
		cmd = "Gitsigns",
		setup = function()
			require("core.lazy_load").gitsigns()
		end,
		config = function()
			require("conf.gitsigns")
		end,
	},

	["sindrets/diffview.nvim"] = {
		opt = true,
		cmd = require("core.lazy_load").diffview_cmds,
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("conf.diffview")
		end,
	},

	["ethanholz/nvim-lastplace"] = {
		config = function()
			require("conf.others").lastplace()
		end,
	},

	["rcarriga/nvim-dap-ui"] = {
		module = "dapui",
		config = function()
			require("conf.dap-ui")
		end,
	},

	["theHamsta/nvim-dap-virtual-text"] = {
		after = "nvim-dap-ui",
		config = function()
			require("conf.dap-virtual-text")
		end,
	},

	["mfussenegger/nvim-dap"] = {
		keys = { "F8", "F5" },
		module = "dap",
		config = function()
			require("conf.dap-config").setup()
			require("conf.dap-util")
		end,
	},

	["jayp0521/mason-nvim-dap.nvim"] = {
		after = "nvim-dap",
		config = function()
			require("conf.others").mason_dap()
		end,
	},

	["sakhnik/nvim-gdb"] = {
		run = "./install.sh",
		keys = "<leader>dd",
		config = function()
			require("conf.nvim-gdb")
		end,
	},

	["phaazon/hop.nvim"] = {
		opt = true,
		branch = "v1",
		cmd = require("core.lazy_load").hop_cmds,
		config = function()
			require("conf.others").hop()
		end,
	},

	["CRAG666/code_runner.nvim"] = {
		opt = true,
		requires = { "nvim-lua/plenary.nvim" },
		cmd = require("core.lazy_load").coderunner_cmds,
		config = function()
			require("conf.code-runner")
		end,
	},

	["brglng/vim-im-select"] = {
		disable = true,
		config = function()
			require("conf.others").im_select()
		end,
	},

	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("conf.project")
		end,
	},

	-- ["Kohirus/cppassist.nvim"] = {
	["~/cppassist.nvim"] = {
		opt = true,
		ft = { "h", "cpp", "hpp", "c", "cc" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("cppassist").setup()
		end,
	},
}

return packer.startup(function(use)
	local final_tab = {}

	for key, _ in pairs(plugins) do
		plugins[key][1] = key
		final_tab[#final_tab + 1] = plugins[key]
	end

	for _, v in pairs(plugins) do
		use(v)
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
