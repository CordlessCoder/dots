local M = {}

M.editor = {
   v = {
      ["<Tab>"] = { ">", "   Indent selected lines" },
      ["<S-Tab>"] = { "<", "   Unindent selected lines" },
   },
   n = {
      ["<C-s>"] = { "<cmd> w <CR>", "   Save file" },
      ["<C-S>"] = { "<cmd> wa <CR>", "   Save all files" },
      ["<C-g>"] = { "<cmd> TZFocus <CR>", "Focus mode" },
      ["<C-t>"] = { "<cmd> tabedit <CR>", "New tab" },
      ["<leader>tn"] = { "<cmd> tabn <CR>", "next tab" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "Focus mode" },
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "Focus mode, ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "Focus mode, minimal" },
      ["<leader>cc"] = { "<cmd> ColorizerToggle <CR>", "   Toggle colorizer" },
      ["<C-h>"] = { "<C-w>h", "Focus window to the left" },
      ["<C-j>"] = { "<C-w>j", "Focus window downwards" },
      ["<C-k>"] = { "<C-w>k", "Focus window upwards" },
      ["<C-l>"] = { "<C-w>l", "Focus window to the right" },
      ["gx"] = {
         function()
            local url = string.match(vim.fn.getline ".", "[a-z]*://[^ >,;()]*")
            if url ~= "" then
               vim.cmd("silent exec \"!open '" .. url .. "'\"")
            else
               vim.cmd 'echo "No URI found in line."'
            end
         end,
         "   Open URL",
      },
   },
}

return M
