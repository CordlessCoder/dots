-- custom/plugins/init.lua
local pluginConfs = require "custom.plugins.configs"

return {
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
    },
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = "cubic", -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }
    end,
  },
  ["saecki/crates.nvim"] = {
    tag = "v0.2.1",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    -- after = "nvim-dap",
    config = function()
      require "custom.plugins.configs.dapui"
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.plugins.configs.dap"
    end,
  },
  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("rust-tools").setup {
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
            -- vim.keymap.set("n", "<A-Up>", require("rust-tools").move_item.move_item(true), { buffer = bufnr })
            -- vim.keymap.set("n", "<A-Down>", require("rust-tools").move_item.move_item(false), { buffer = bufnr })
            -- Code action groups
            vim.keymap.set(
              "n",
              "<Leader>a",
              require("rust-tools").code_action_group.code_action_group,
              { buffer = bufnr }
            )
          end,
        },
      }
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        "rust-analyzer",
        "python-lsp-server",

        -- web dev
        "css-lsp",
        "html-lsp",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        separator_style = "block",
        -- overriden_modules = function()
        -- return require "custom.abc"
        -- end,
      },
      tabufline = {
        enabled = true,
      },
    },
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = pluginConfs.treesitter,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = pluginConfs.telescope,
  },
  ["mattn/webapi-vim"] = {},
  ["rust-lang/rust.vim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      -- require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["axieax/urlview.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("urlview").setup {
        default_title = "URIs:",
        default_picker = "telescope",
        navigate_method = "system",
        unique = true,
      }
      require("telescope").load_extension "urlview"
    end,
  },
  ["NvChad/nvterm"] = {
    module = "nvterm",
    config = function()
      require "custom.plugins.configs.nvterm"
    end,
  },
  ["mg979/vim-visual-multi"] = {},
  ["wakatime/vim-wakatime"] = {
    -- setup = function()
    -- require("core.utils").packer_lazy_load "vim-wakatime"
    -- end,
  },
  ["nathom/filetype.nvim"] = {},
  -- ["mtoohey31/cmp-fish"] = { ft = "fish", after = "nvim-cmp" },
  ["hrsh7th/nvim-cmp"] = {
    -- config = function()
    --   require "custom.plugins.configs.cmp"
    -- end,
    override_options = pluginConfs.cmp,
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
    -- setup = function()
    -- require("core.utils").packer_lazy_load "yuck.vim"
    -- end,
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
      require "custom.plugins.custom.truezen"
    end,
  },
  ["justinmk/vim-sneak"] = {},
  ["f-person/git-blame.nvim"] = {},
  ["ellisonleao/glow.nvim"] = {
    branch = "main",
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
    config = function()
      require("custom.plugins.configs.null-ls").setup()
    end,
  },
}
