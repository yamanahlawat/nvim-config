-- Set default colorscheme
vim.cmd.colorscheme("default")
vim.o.background = "dark"

-- Custom color overrides for pure black/white
-- Main editor colors
vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#000000" })

-- NvimTree specific colors
vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { fg = "#000000", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#ffffff", bg = "#000000" })

-- Set cursor shape and blinking (optional)
vim.opt.guicursor =
  "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,o:hor50-Cursor/lCursor"
