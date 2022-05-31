local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
local userPlugins = require("custom.plugins")
local pluginConfs = require("custom.plugins.configs")

M.plugins = {
	override = {
		["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
		["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
	},
	user = userPlugins,
	options = {
		statusline = {
			separator_style = "block",
		},
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},
	},
}

M.options = {
	user = function()
		require("custom.options")
	end,
}
M.mappings = require("custom.mappings")

M.ui = {
	hl_override = {
		AlphaShortcut9 = { fg = "#c0caf5", bg = "#565c70" },
		AlphaShortcut8 = { fg = "#b1b8e0", bg = "#4f5466" },
		AlphaShortcut7 = { fg = "#a9b0d6", bg = "#474c5c" },
		AlphaShortcut6 = { fg = "#a1a8cc", bg = "#3f4452" },
		AlphaShortcut5 = { fg = "#99a0c2", bg = "#373b47" },
		AlphaShortcut4 = { fg = "#9197b8", bg = "#2f323d" },
		AlphaShortcut3 = { fg = "#898ead", bg = "#272a33" },
		AlphaShortcut2 = { fg = "#8185a3", bg = "#1f2229" },
		AlphaShortcut1 = { fg = "#797d99", bg = "#181a1f" },
		AlphaShortcut0 = { fg = "#71748f", bg = "#101114" },
		Alpha0 = { fg = "#c0caf5" },
		Alpha1 = { fg = "#adb6de" },
		Alpha2 = { fg = "#9ba3c7" },
		Alpha3 = { fg = "#8990b0" },
		Alpha4 = { fg = "#777e99" },
		Alpha5 = { fg = "#656b82" },
		Alpha6 = { fg = "#54586b" },
		Alpha7 = { fg = "#424554" },
		Alpha8 = { fg = "#30323d" },
		Alpha9 = { fg = "#1e1f26" },
	},
	theme = "tokyodark",
	theme_toggle = { "tokyonight", "tokyodark" },
}

return M
