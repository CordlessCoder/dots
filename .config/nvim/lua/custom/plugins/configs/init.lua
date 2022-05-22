local M = {}

M.treesitter = {
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
   extensions = {
      -- fd is needed
      media_files = {
         filetypes = { "png", "webp", "jpg", "jpeg" },
      },
   },
}

return M
