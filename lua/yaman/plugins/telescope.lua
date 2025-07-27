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
        -- Exclude common directories you don't want to search
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "%.venv/",
          "venv/",
          "__pycache__/",
          "%.pytest_cache/",
          "%.coverage/",
          "%.ruff_cache/",
          "build/",
          "dist/",
          "target/",
          "%.next/",
          "%.nuxt/",
          "%.cache/",
          "%.DS_Store",
          "%.lock",
          "package%-lock%.json",
          "yarn%.lock",
          "Cargo%.lock",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        -- Let TokyoNight handle the border styling
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      pickers = {
        find_files = {
          -- Show hidden files like .env, .gitignore, etc.
          hidden = true,
          -- Don't respect .gitignore to find all hidden files
          no_ignore = true,
        },
        live_grep = {
          -- Search in hidden files
          additional_args = function()
            return { "--hidden" }
          end,
        },
        grep_string = {
          -- Search in hidden files
          additional_args = function()
            return { "--hidden" }
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
