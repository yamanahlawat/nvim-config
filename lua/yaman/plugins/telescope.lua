return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Set up telescope border highlights using horizon theme primary color
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#E9436F" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#E9436F" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#E9436F" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#E9436F" })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        layout_config = {
          prompt_position = "bottom",
          horizontal = {
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          -- Ensure find_files specifically shows all files
          hidden = true,
          no_ignore = true,
        },
        live_grep = {
          -- Also show hidden/ignored files in grep
          additional_args = function()
            return { "--hidden", "--no-ignore" }
          end,
        },
        grep_string = {
          -- Also show hidden/ignored files in grep string
          additional_args = function()
            return { "--hidden", "--no-ignore" }
          end,
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
