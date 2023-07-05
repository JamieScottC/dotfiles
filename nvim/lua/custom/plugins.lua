local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format {
          filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        }
      end
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      require("null-ls").setup {
        on_attach = function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                lsp_formatting(bufnr)
              end,
            })
          end
        end,
        sources = {
          require("null-ls").builtins.formatting.prettier,
          require("null-ls").builtins.formatting.stylua,
        },
      }
    end,
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        -- your config
      }
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
      },
    },
  },
}
return plugins
