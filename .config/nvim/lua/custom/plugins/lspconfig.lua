local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "rust_analyzer", "jedi_language_server", "html", "cssls", "clangd", "sumneko_lua", "emmet_ls" }
   for _, lsp in ipairs(servers) do
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

return M
