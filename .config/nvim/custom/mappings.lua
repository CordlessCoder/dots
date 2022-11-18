local M = {}
M.editor = {
  v = {
    ["<leader>p"] = { '"-dP', "paste without replacing buffer" },
    ["<leader>e"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate selection",
    },
    ["<Tab>"] = { ">", "   Indent selected lines" },
    ["<S-Tab>"] = { "<", "   Unindent selected lines" },
    ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "Perform code action on selection" },
  },
  n = {
    ["<leader>p"] = { '"-dP', "paste without replacing buffer" },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "Hover action",
    },
    ["<leader>e"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "DAP continue",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "DAP toggle breakpoint",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
      "DAP step over",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "DAP step in",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "DAP step in",
    },
    ["<leader>dt"] = {
      function()
        require("dapui").toggle()
      end,
      "DAP step in",
    },
    ["<leader>gb"] = { "<cmd>GitBlameToggle<CR>", "Toggle git blame" },
    ["<leader>a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Perform code action" },
    ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Perform code action" },
    ["<leader>n"] = { "<cmd>NvimTreeToggle <CR>", "   toggle nvimtree" },
    ["<C-n>"] = { "<cmd>execute 'normal <Plug>(VM-Find-Under)' <CR>", "   toggle nvimtree" },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "   lsp formatting",
    },
    ["<C-s>"] = { "<cmd> w <CR>", "   Save file" },
    ["<C-S>"] = { "<cmd> wa <CR>", "   Save all files" },
    ["<C-g>"] = { "<cmd> TZFocus <CR>", "Focus mode" },
    -- ["<C-t>"] = { "<cmd> tabedit <CR>", "New tab" },
    ["<leader>tn"] = { "<cmd> tabn <CR>", "next tab" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "Focus mode" },
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "Focus mode, ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "Focus mode, minimal" },
    ["<leader>cc"] = { "<cmd> ColorizerToggle <CR>", "   Toggle colorizer" },
    ["<C-h>"] = { "<C-w>h", "Focus window to the left" },
    ["<C-j>"] = { "<C-w>j", "Focus window downwards" },
    ["<C-k>"] = { "<C-w>k", "Focus window upwards" },
    ["<C-l>"] = { "<C-w>l", "Focus window to the right" },
    ["<C-->"] = {
      function()
        local cur_font = vim.opt.guifont:get()[1]
        local fontsize = 14
        local t = {}
        for size in string.gmatch(cur_font, "([^" .. ":" .. "]+)") do
          fontsize = tonumber(string.sub(size, 2))
          table.insert(t, size)
        end
        fontsize = fontsize - 1
        vim.opt.guifont = t[1] .. ":h" .. fontsize
      end,
      "Decrease font size",
    },
    ["<C-+>"] = {
      function()
        local cur_font = vim.opt.guifont:get()[1]
        local fontsize = 15
        local t = {}
        for size in string.gmatch(cur_font, "([^" .. ":" .. "]+)") do
          fontsize = tonumber(string.sub(size, 2))
          table.insert(t, size)
        end
        fontsize = fontsize + 1
        vim.opt.guifont = t[1] .. ":h" .. fontsize
      end,
      "Increase font size",
    },
    ["<C-=>"] = {
      function()
        local cur_font = vim.opt.guifont:get()[1]
        local fontsize = 15
        local t = {}
        for size in string.gmatch(cur_font, "([^" .. ":" .. "]+)") do
          fontsize = tonumber(string.sub(size, 2))
          table.insert(t, size)
        end
        fontsize = fontsize + 1
        vim.opt.guifont = t[1] .. ":h" .. fontsize
      end,
      "Increase font size",
    },
    ["<C-0>"] = {
      function()
        local cur_font = vim.opt.guifont:get()[1]
        local t = {}
        for size in string.gmatch(cur_font, "([^" .. ":" .. "]+)") do
          table.insert(t, size)
        end
        vim.opt.guifont = t[1] .. ":h" .. 15
      end,
      "Reset font size (to 14)",
    },
    ["gz"] = {
      "<cmd> UrlView <CR>",
      "Open URL list in Telescope",
    },
    ["gx"] = {
      function()
        local line = vim.fn.getline "."
        if line ~= "" then
          local command = string.format(
            'echo "%s" | grep -Po "(http|https)://[A-z-#/]+[^ >,;()]*" | xargs -I "{}" xdg-open "{}" 2> /dev/null',
            line
          )
          os.execute(command)
        else
          vim.cmd 'echo "Empty line"'
        end
      end,
      "Open URL",
    },
  },
}

return M
