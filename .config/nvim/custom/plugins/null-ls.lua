local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {

	b.formatting.trim_whitespace,
	b.formatting.prettierd.with({ filetypes = { "lua", "html", "markdown", "css" } }),
	b.formatting.deno_fmt,

	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck.with({ extra_args = { "--global", "vim" } }),

	-- Shells
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	b.diagnostics.fish,
	b.formatting.fish_indent,

	-- Python
	b.formatting.black,
	b.diagnostics.flake8.with({ extra_args = { "--max-line-length", "120" } }),

	-- Rust
	b.formatting.rustfmt.with({ extra_args = { "--edition=2021" } }),
}

local M = {}
M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
