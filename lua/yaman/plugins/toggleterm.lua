return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]], -- Ctrl+\ to toggle
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float", -- 'vertical' | 'horizontal' | 'float' | 'tab'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Custom terminal functions
    local Terminal = require("toggleterm.terminal").Terminal

    -- Node REPL
    local node = Terminal:new({
      cmd = "node",
      hidden = true,
    })

    -- Python REPL
    local python = Terminal:new({
      cmd = "python",
      hidden = true,
    })

    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Toggle terminal (using 't' prefix for terminal-related commands)
    keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
    keymap("n", "<leader>tF", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
    keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
    keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>", { desc = "Toggle vertical terminal" })

    keymap("n", "<leader>tr", function()
      node:toggle()
    end, { desc = "Toggle Node REPL" })
    keymap("n", "<leader>ty", function()
      python:toggle()
    end, { desc = "Toggle Python REPL" })

    -- Terminal mode keymaps for navigation
    keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
  end,
}
