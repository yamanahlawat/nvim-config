return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
      end,
    })
  end,
}
