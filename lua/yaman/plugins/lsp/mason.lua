return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- NEW V2 APPROACH: Mason-LSPConfig automatically enables servers
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",         -- typescript
        "html",          -- html
        "cssls",         -- css
        "tailwindcss",   -- tailwindcss
        "lua_ls",        -- lua
        "pyright",       -- python
        "ruff",          -- python
        "rust_analyzer", -- rust
        "jsonls",        -- json
        "yamlls",        -- yaml
        "dockerls",      -- docker
        "marksman",      -- markdown
        "eslint",        -- js/ts linting
      },
      -- Mason-LSPConfig v2 automatically enables servers by default
      automatic_enable = true, -- This is the default, but being explicit
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "ruff",     -- python linter/formatter
      },
    })
  end,
}
