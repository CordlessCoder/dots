-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
local userPlugins = require "custom.plugins"
local pluginConfs = require "custom.plugins.configs"

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
  },
  user = userPlugins,
  options = {
    statusline = {
      separator_style = "block"
    },
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig"
    },
  },
}


M.options = {
  user = function()
    require("custom.options")
  end
}


M.ui = {
   theme = "tokyodark",
   theme_toggle = {"tokyonight", "tokyodark"}
}

return M
