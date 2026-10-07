local lazygit_buf

local function open_lazygit_tab()
  if lazygit_buf and vim.api.nvim_buf_is_valid(lazygit_buf) then
    local win = vim.fn.win_findbuf(lazygit_buf)[1]
    if win then
      vim.api.nvim_set_current_win(win)
    else
      vim.cmd("tab sbuffer " .. lazygit_buf)
    end
    return
  end

  vim.cmd.tabnew()
  local buf = vim.api.nvim_get_current_buf()
  lazygit_buf = buf
  vim.fn.jobstart({ "lazygit" }, {
    term = true,
    on_exit = function()
      vim.api.nvim_buf_delete(buf, { force = true })
    end,
  })
  vim.api.nvim_create_autocmd("BufEnter", { buffer = buf, command = "startinsert" })
  vim.cmd.startinsert()
end

return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", open_lazygit_tab, desc = "Open lazy git in new tab" },
  },
}
