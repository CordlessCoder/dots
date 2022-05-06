-- custom/plugins/init.lua

return {

   ["elkowar/yuck.vim"] = {
     ft = "yuck",
   },
   ["github/copilot.vim"] = {},
   ["andweeb/presence.nvim"] = {
     config = function()
       require "presence":setup({
         neovim_image_text = "I am still in your walls.",
       })
      end
   },
   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
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
  }
}
