-- custom/plugins/init.lua

return {
   ["dylanaraps/wal.vim"] = {},
   ["simrat39/rust-tools.nvim"] = {
      setup = {
         hover_actions = {
            border = {
               { "╭", "FloatBorder" },
               { "─", "FloatBorder" },
               { "╮", "FloatBorder" },
               { "│", "FloatBorder" },
               { "╯", "FloatBorder" },
               { "─", "FloatBorder" },
               { "╰", "FloatBorder" },
               { "│", "FloatBorder" },
            },
         },
      },
   },
   ["nathom/filetype.nvim"] = {},
   ["mtoohey31/cmp-fish"] = { ft = "fish" },
   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "custom.plugins.configs.cmp"
      end,
   },
   ["nvim-telescope/telescope-media-files.nvim"] = {
      after = "telescope.nvim",
      config = function()
         require("telescope").load_extension "media_files"
      end,
   },
   ["goolord/alpha-nvim"] = {
      disable = false,
      config = function()
         require "custom.plugins.configs.alpha"
      end,
   },
   ["elkowar/yuck.vim"] = {
      ft = "yuck",
      setup = function()
         require("core.utils").packer_lazy_load "yuck.vim"
      end,
   },
   ["andweeb/presence.nvim"] = {
      config = function()
         require("presence"):setup {
            neovim_image_text = "I am still in your walls.",
            buttons = {
               { label = "I stole all of your code.", url = "https://github.com/CordlessCoder/dots" },
               { label = "Pipe bomb is attached.", url = "https://github.com/CordlessCoder/Wallpapers" },
            },
         }
      end,
   },
   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
      setup = function()
         require("core.utils").packer_lazy_load "TrueZen.nvim"
      end,
   },
   -- ["karb94/neoscroll.nvim"] = {
   -- config = function()
   -- require("neoscroll").setup({
   -- easing_function = "sine",
   -- })
   -- end,

   -- lazy loading
   -- setup = function()
   -- require("core.utils").packer_lazy_load("neoscroll.nvim")
   -- end,
   -- },
   ["justinmk/vim-sneak"] = {
      setup = function()
         require("core.utils").packer_lazy_load "vim-sneak"
      end,
   },
   ["f-person/git-blame.nvim"] = {
      setup = function()
         require("core.utils").packer_lazy_load "git-blame.nvim"
      end,
   },
   ["ellisonleao/glow.nvim"] = {
      branch = "main",
      setup = function()
         require("core.utils").packer_lazy_load "glow.nvim"
      end,
   },
   ["iamcco/markdown-preview.nvim"] = {
      run = "cd app && npm install",
      setup = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
   },
   ["luukvbaal/stabilize.nvim"] = {
      config = function()
         require("stabilize").setup()
      end,
   },
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      setup = function()
         require("core.utils").packer_lazy_load "null-ls.nvim"
      end,
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
}
