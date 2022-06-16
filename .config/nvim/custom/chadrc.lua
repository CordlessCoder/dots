local M = {}

local userPlugins = require "custom.plugins"
local pluginConfs = require "custom.plugins.configs"

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
      require "custom.options"
   end,
}
M.mappings = require "custom.mappings"

M.ui = {
   theme = "pywal",
   theme_toggle = { "pywal", "tokyodark" },
}

return M
