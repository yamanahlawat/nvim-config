return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    { "windwp/nvim-ts-autotag", opts = {} },
  },
  config = function()
    -- Install parsers (no-op if already installed)
    require("nvim-treesitter").install({
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "python",
      "rust",
    })

    -- Enable treesitter highlighting and indentation for all filetypes with a parser
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
