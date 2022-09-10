local M = {}

M.plugins = require "custom.plugins"


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
