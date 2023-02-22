vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
return {

	-- the colorscheme should be available when starting Neovim
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 100, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
				["core.integrations.treesitter"] = {
					config = {
						configure_parsers = true,
						install_parsers = true,
					},
				},
				["core.norg.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
		lazy = true,
		ft = "neorg",
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = "InsertEnter",
		cmd = {
			"CommentToggle",
		},
		keys = {
			{ "gcc", mode = "n" },
			{ "gco", mode = "n" },
			{ "gcO", mode = "n" },
			{ "gcA", mode = "n" },
			{ "gbc", mode = "n" },
			{ "gb", mode = "v" },
			{ "gc", mode = "v" },
		},
		config = function()
			require("Comment").setup()
		end,
	},

	-- {
	-- "dstein64/vim-startuptime",
	-- -- lazy-load on a command
	-- cmd = "StartupTime",
	-- },

	-- you can use the VeryLazy event for things that can
	-- load later and are not important for the initial UI
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	{
		"simrat39/rust-tools.nvim",
		enable = true,
		-- after = "nvim-lspconfig",
		config = function()
			local rt = require("rust-tools")
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
						-- Open Cargo.toml
						vim.keymap.set("n", "<Leader>ct", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
						-- Move item down
						vim.keymap.set("n", "<Leader>md", function()
							rt.move_item.move_item(false)
						end, { buffer = bufnr, desc = "Move Rust item down" })
						-- Move item up
						vim.keymap.set("n", "<Leader>mu", function()
							rt.move_item.move_item(true)
						end, { buffer = bufnr, desc = "Move Rust item up" })
					end,
					["rust-analyzer"] = {
						checkOnSave = {
							command = "cargo clippy --all",
						},
					},
				},
			})
		end,
		lazy = true,
		event = "BufEnter",
	},
	{
		"monaqa/dial.nvim",
		-- lazy-load on keys
		-- mode is `n` by default. For more advanced options, check the section on key mappings
		keys = { "<C-a>", "<C-x>" },
		lazy = true,
	},

	{ "lewis6991/impatient.nvim" },

	{
		"Pocco81/TrueZen.nvim",
		cmd = {
			"TZAtaraxis",
			"TZMinimalist",
			"TZFocus",
			"TZNarrow",
		},
		config = function()
			require("plugins.configs.truezen")
		end,
		lazy = true,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.mason")
		end,
		cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll" },
		lazy = true,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lspconfig" },
		config = function()
			require("plugins.configs.null-ls").setup()
		end,
		event = "BufEnter",
		lazy = true,
	},

	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.alpha")
		end,
		lazy = false,
	},

	{ "justinmk/vim-sneak", lazy = true, keys = { { "s", mode = "n" } } },
	{ "f-person/git-blame.nvim", lazy = true, event = "VeryLazy" },

	-- The tree file manager
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugins.configs.nvim-tree")
		end,
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
		lazy = true,
	},
	{
		"glepnir/galaxyline.nvim",
		branch = "main",
		-- your statusline
		config = function()
			require("plugins.configs.galaxyline")
		end,
		-- some optional icons
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence"):setup({
				neovim_image_text = "I am still in your walls.",
				buttons = {
					{ label = "I stole all of your code.", url = "https://github.com/CordlessCoder/OxiiLink" },
					{ label = "Pipe bomb is attached.", url = "https://github.com/CordlessCoder/Wallpapers" },
				},
				enable_line_number = true,
				line_number_text = "Line %s/%s",
			})
		end,
		event = "BufEnter",
		lazy = true,
	},

	{ "rstacruz/vim-closer", lazy = true, event = "BufEnter" },
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
	{ "hrsh7th/cmp-path", event = "InsertEnter" },
	{ "hrsh7th/cmp-cmdline", event = "InsertEnter" },
	{ "L3MON4D3/LuaSnip", event = "InsertEnter" },

	{
		"saecki/crates.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
		ft = "toml",
		event = "InsertEnter",
		lazy = true,
	},
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		config = function()
			require("plugins.configs.cmp")
		end,
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"rstacruz/vim-closer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		dependencies = { "plenary.nvim" },
		init = function()
			require("plugins.configs.telescope")
		end,
		cmd = { "Telescope" },
		lazy = true,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
		cmd = { "LspInfo", "LspRestart", "LspStart" },
		lazy = false,
	},

	-- Lazy loading:
	-- Load on specific commands
	-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

	-- Load on an autocommand event
	-- use {'andymass/vim-matchup', event = 'VimEnter'}

	-- Plugins can have post-install/update hooks
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

	{ "p00f/nvim-ts-rainbow", event = "VeryLazy", lazy = true },

	-- Post-install/update hook with neovim command
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufEnter",
		config = function()
			require("nvim-treesitter").setup({
				highlight = {
					enable = true,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
					colors = {
						"#B7C1EA",
						"#F7768E",
						"#97C566",
						"#D6A764",
						"#759BEC",
						"#B393EC",
						"#78C6F3",
						"#AAB2D5",
					},
				},
				ensure_installed = {
					"lua",
					"html",
					"css",
					"python",
					"markdown",
					"bash",
					"rust",
					"fish",
				},
			})
			vim.cmd([[TSEnable highlight]])
		end,
		lazy = true,
	},

	-- you can use a custom url to fetch a plugin
	-- { url = "git@github.com:folke/noice.nvim.git" },
}
