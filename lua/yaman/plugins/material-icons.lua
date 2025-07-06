return {
  "DaikyXendo/nvim-material-icon",
  lazy = false,
  priority = 1000, -- Load before other plugins that depend on icons
  config = function()
    require("nvim-web-devicons").setup({
      -- globally enable different highlight colors per icon (default to true)
      color_icons = true,
      -- globally enable default icons (default to false)
      default = true,
      -- strict icon selection
      strict = true,
    })
  end,
}
