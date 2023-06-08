local M = {}
M.ui = {
  changed_themes = {
    catppuccin = {
      base_30 = {
        line = "#5b5975",
      },
      base_16 = {
        base02 = "#765b78",
        base08 = "#F38BA8",
        base0F = "#F38BA8",
      }
    },
  },
  theme = 'catppuccin'
}
M.plugins = 'custom.plugins'
M.mappings = require "custom.mappings"
return M
