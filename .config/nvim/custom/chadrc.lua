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
   statusline = {
      separator_style = "block", -- default/round/block/arrow
   },
   theme = "pywal",
   theme_toggle = { "pywal", "tokyodark" },
}

return M
