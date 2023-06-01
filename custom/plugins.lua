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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      require('null-ls').setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
        sources = {
          require("null-ls").builtins.formatting.prettier,
          require("null-ls").builtins.formatting.stylua
        },
      })
    end,
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require("custom.configs.lspconfig")
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup({
        -- your config
      })
    end,
    lazy = true,
    event = "VeryLazy"
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server"
      },
    },
  }
}
return plugins
