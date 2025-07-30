return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {"lua_ls", "eslint"}
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action)
    end

  },
  {
    {
      "hrsh7th/nvim-cmp",
      version = false, -- last release is way too old
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
      -- Not all LSP servers add brackets when completing a function.
      -- To better deal with this, LazyVim adds a custom option to cmp,
      -- that you can configure. For example:
      --
      -- ```lua
      -- opts = {
        --   auto_brackets = { "python" }
        -- }
        -- ```
        opts = function()
          vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
          local cmp = require("cmp")
          local defaults = require("cmp.config.default")()
          local auto_select = true
          return {
            auto_brackets = {}, -- configure any filetype to auto add brackets
            completion = {
              completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.insert({
              ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select}),
              ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
              ["<C-y>"] = cmp.mapping.confirm({select = true}),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-CR>"] = function(fallback)
                cmp.abort()
                fallback()
              end,
            }),
            sources = cmp.config.sources({
              { name = "lazydev" },
              { name = "nvim_lsp" },
              { name = "path" },
            }, {
              { name = "buffer" },
            }),
            sorting = defaults.sorting,
          }
        end,
      }
    }

  }
