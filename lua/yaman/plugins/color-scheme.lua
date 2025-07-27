return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- Style options: night, storm, moon, day
      style = "night", -- Darkest variant, similar to your current Horizon
      light_style = "day",
      transparent = false,
      terminal_colors = true,

      styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = false },
        variables = {},
        sidebars = "dark", -- style for sidebars
        floats = "dark", -- style for floating windows
      },

      sidebars = { "qf", "help", "vista_kind", "terminal", "packer", "NvimTree" },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false, -- When `true`, section headers in lualine will be bold

      -- Plugin integration (matching your current plugins)
      integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        nvimtree = true,
        telescope = {
          enabled = true,
        },
        which_key = true,
        notify = true,
        treesitter = true,
        alpha = true,
        bufferline = true,
        mason = true,
        neo_tree = true,
        trouble = true,
        lsp_trouble = true,
        markdown = true,
        mini = true,
      },

      -- Override specific colors if needed
      on_colors = function(colors)
        -- You can customize specific colors here
        -- colors.hint = colors.orange
        -- colors.error = "#ff0000"
      end,

      on_highlights = function(highlights, colors)
        -- Custom Telescope styling to match TokyoNight theme
        highlights.TelescopeBorder = { fg = colors.blue0, bg = colors.bg }
        highlights.TelescopePromptBorder = { fg = colors.blue0, bg = colors.bg }
        highlights.TelescopePromptTitle = { fg = colors.bg, bg = colors.blue0, bold = true }
        highlights.TelescopePreviewBorder = { fg = colors.green, bg = colors.bg }
        highlights.TelescopePreviewTitle = { fg = colors.bg, bg = colors.green, bold = true }
        highlights.TelescopeResultsBorder = { fg = colors.blue1, bg = colors.bg }
        highlights.TelescopeResultsTitle = { fg = colors.bg, bg = colors.blue1, bold = true }

        -- Additional Telescope styling
        highlights.TelescopePromptNormal = { bg = colors.bg }
        highlights.TelescopeResultsNormal = { bg = colors.bg }
        highlights.TelescopePreviewNormal = { bg = colors.bg }

        -- Selection highlighting
        highlights.TelescopeSelection = { fg = colors.fg, bg = colors.bg_highlight, bold = true }
        highlights.TelescopeSelectionCaret = { fg = colors.red, bg = colors.bg_highlight }

        -- Matching text highlighting
        highlights.TelescopeMatching = { fg = colors.blue }
      end,
    })

    -- Set the colorscheme
    vim.cmd.colorscheme("tokyonight")

    -- Optional: Set background (dark or light)
    vim.o.background = "dark"
  end,
}
