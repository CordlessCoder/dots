local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local servers = {
  "pylsp",
  "rust_analyzer",
  "html",
  "cssls",
  "sumneko_lua",
  "emmet_ls",
  "bashls",
  "html",
  "tsserver",
  "clangd",
  -- "taplo",
  "gopls",
}

for _, lsp in ipairs(servers) do
  if lsp ~= "sumneko_lua" and lsp ~= "pylsp" and lsp ~= "rust_analyzer" then
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        if lsp == "emmet_ls" or lsp == "html" then
          capabilities.textDocument.completion.completionItem.snippetSupport = true
        end
      end,
      capabilities = capabilities,
    }
  end
end
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    ["rust_analyzer"] = {
      semanticHighlighting = {
        punctuation = {
          enable = true,
        },
        --   operator = {
        --     specialization = {
        --       enable = true,
        --     },
        --   },
      },
      lru = {
        capacity = 256,
      },
      typing = {
        autoClosingAngleBrackets = {
          enable = true,
        },
      },
    },
  },
}
lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    pylsp = {
      plugins = {
        jedi_completion = {
          fuzzy = true,
        },
        pyflakes = {
          enabled = false,
        },
        yapf = {
          enabled = false,
        },
        autopep8 = {
          enabled = false,
        },
        flake8 = {
          enabled = true,
          maxLineLength = 129,
          indentsize = 4,
        },
        pycodestyle = {
          -- ignore = { "W391" },
          enabled = false,
          maxLineLength = 129,
        },
      },
    },
  },
}
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
