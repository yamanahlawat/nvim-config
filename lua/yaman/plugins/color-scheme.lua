return {
  {
    "akinsho/horizon.nvim",
    name = "horizon",
    version = "*",
    priority = 1000,
    config = function()
      require("horizon").setup({
        -- Plugin integration (matching your current plugins)
        plugins = {
          cmp = true,
          gitsigns = true,
          indent_blankline = true,
          nvim_tree = true,
          telescope = true,
          which_key = true,
          notify = true,
        },
        -- Override specific colors if needed
        overrides = {
          -- You can customize colors here
          -- Example: CursorLine = { bg = '#1A1C23' }
        },
      })

      -- Set the colorscheme
      vim.cmd.colorscheme("horizon")

      -- Optional: Set background (dark or light)
      vim.o.background = "dark"
    end,
  },
}
