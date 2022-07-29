local M = {}

local userPlugins = require "custom.plugins"
local pluginConfs = require "custom.plugins.configs"

M.plugins = {
  override = {
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        "rust-analyzer",
        "python-lsp-server",

        -- web dev
        "css-lsp",
        "html-lsp",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
    ["NvChad/ui"] = {
      statusline = {
        separator_style = "block",
        -- overriden_modules = function()
        -- return require "custom.abc"
        -- end,
      },
      tabufline = {
        enabled = true,
      },
    },
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
  },
  user = userPlugins,
  options = {
    -- lspconfig = {
    --   setup_lspconf = "custom.plugins.lspconfig",
    -- },
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
  -- transparency = true,
  theme_toggle = { "pywal", "tokyodark" },
}

return M
