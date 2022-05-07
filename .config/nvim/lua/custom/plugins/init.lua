-- custom/plugins/init.lua


return {
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
    },
    ["andweeb/presence.nvim"] = {
      config = function()
       require "presence":setup({
         neovim_image_text = "I am still in your walls.",
         buttons = ({{label = "I stole all of your code.", url = "https://github.com/CordlessCoder/dots"}, {label = "Pipe bomb is attached.", url = "https://github.com/CordlessCoder/Wallpapers"}})
      })
      end
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
      end
   },
     ["karb94/neoscroll.nvim"] = {
       config = function()
          require("neoscroll").setup({
            easing_function = "sine",
          })
       end,

       -- lazy loading
       setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
       end,
     },
     ["justinmk/vim-sneak"] = {},
     ["f-person/git-blame.nvim"] = {},
     ["ellisonleao/glow.nvim"] = {
       branch = 'main',
       setup = function()
         require("core.utils").packer_lazy_load "glow.nvim"
       end
   },
   ["iamcco/markdown-preview.nvim"] = {
     setup = function()
       require("core.utils").packer_lazy_load "markdown-preview.nvim"
     end
   },
   ["averms/black-nvim"] = {
       setup = function()
         require("core.utils").packer_lazy_load "black-nvim"
       end,
    },
    ["luukvbaal/stabilize.nvim"] = {
    config = function()
            require("stabilize").setup()
        end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.null-ls").setup()
      end,
    },
}
