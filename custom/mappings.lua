local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

M.abc = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "Down Center" },
    ["<C-u>"] = { "<C-u>zz", "Up Center" },
    ["<C-a>"] = { "ggVG", "Select All" }
  },
}
return M
