return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = false,
      git_cmd = { "git" },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,

      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
        },
      },

      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
        },
        win_config = {
          position = "right",
          width = 35,
        },
      },

      keymaps = {
        disable_defaults = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { desc = "Open diffview" })
    keymap.set("n", "<leader>dvc", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })
    keymap.set("n", "<leader>dvh", "<cmd>DiffviewFileHistory<CR>", { desc = "Open file history" })
    keymap.set("n", "<leader>dvf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Open current file history" })
    keymap.set("n", "<leader>dvr", "<cmd>DiffviewRefresh<CR>", { desc = "Refresh diffview" })
  end,
}
