return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "DaikyXendo/nvim-material-icon" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with horizon theme
    lualine.setup({
      options = {
        theme = "horizon",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
