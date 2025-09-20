return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    -- Neovim 0.11 auto-enables servers, minimal config needed
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "jsonls",
        "yamlls",
        "dockerls",
        "marksman",
        "eslint",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "ruff",
        "eslint_d",
        "sleek",
      },
    })
  end,
}
