return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "%.venv/",
          "__pycache__/",
          "%.next/",
          "%.cache/",
          "%.DS_Store",
          "%.lock",
        },
      },
    })

    require("telescope").load_extension("fzf")

    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
  end,
}
