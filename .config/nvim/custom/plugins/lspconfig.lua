local M = {}
local utils = require "core.utils"

M.on_attach = function(client, bufnr)
   client.server_capabilities.documentFormattingProvider = false
   client.server_capabilities.documentRangeFormattingProvider = false

   local lsp_mappings = utils.load_config().mappings.lspconfig
   utils.load_mappings({ lsp_mappings }, { buffer = bufnr })

   if client.supports_method "textDocument/signatureHelp" then
      vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
         pattern = "*",
         group = vim.api.nvim_create_augroup("LspSignature", {}),
         callback = function()
            vim.lsp.buf.signature_help()
         end,
      })
   end
end

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = {
      "pylsp",
      "rust_analyzer",
      "html",
      "cssls",
      "sumneko_lua",
      "emmet_ls",
   }
   for _, lsp in ipairs(servers) do
      if lsp ~= "sumneko_lua" then
         lspconfig[lsp].setup {
            on_attach = function(client, bufnr)
               attach(client, bufnr)
               if lsp == "emmet_ls" then
                  capabilities.textDocument.completion.completionItem.snippetSupport = true
               end
            end,
            capabilities = capabilities,
         }
      end
   end
   lspconfig.sumneko_lua.setup {
      on_attach = M.on_attach,
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
end
return M
