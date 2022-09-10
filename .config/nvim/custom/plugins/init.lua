-- custom/plugins/init.lua
local pluginConfs = require "custom.plugins.configs"

return {
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
      require("dapui").setup {
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has "nvim-0.7",
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
              -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        },
      }
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    config = function()
      local dap = require "dap"
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},

          -- 💀
          -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
          --
          --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          --
          -- Otherwise you might get the following error:
          --
          --    Error on launch: Failed to attach to the target process
          --
          -- But you should be aware of the implications:
          -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
          -- runInTerminal = false,
        },
      }

      -- If you want to use this for Rust and C, add something like this:

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
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
      require "custom.plugins.lspconfig"
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
      require "custom.plugins.truezen"
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
      require("custom.plugins.null-ls").setup()
    end,
  },
}
