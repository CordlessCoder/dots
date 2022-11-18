local M = {}

M.cmp = {
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "crates" },
  },
}

M.treesitter = {
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
  },
}

M.telescope = {
  -- after = "urlview",
  extensions = {
    -- fd is needed
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
    },
  },
}

return M
