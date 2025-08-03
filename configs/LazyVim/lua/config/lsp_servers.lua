-- ~/.config/nvim/lua/config/lsp_servers.lua
return {
  lsp_servers = {
    "lua_ls",
    "tailwindcss",
    "cssls",
    "html",
    "eslint",
    "jsonls",
    "vtsls",
    "intelephense",
    "pyright",
    "clangd",
    "csharp_ls",
    "jdtls",
    "bashls",
  },

  null_servers = {
    "stylua",
    "prettierd",
    "eslint_d",
    "black",
    "clang_format",
    "csharpier",
    "google-java-format",
  },

  -- Mapeo de LSP a DAP (para debugging.lua)
  lsp_to_dap = {
    -- clangd = "codelldb",
    -- csharp_ls = "netcoredbg",
    -- jdtls = "java-debug-adapter",
    -- pyright = "debugpy",
    -- vtsls = "js-debug-adapter",
    "codelldb", -- C/C++
    "debugpy", -- Python
    "js-debug-adapter", -- JavaScript/TypeScript
    "netcoredbg", -- C#
    "java-debug-adapter", -- Java
  },

  -- Configuraciones especiales para servidores LSP
  special_configs = {
    jdtls = {
      handlers = {
        ["language/status"] = function() end,
        ["$/progress"] = function() end,
      },
    },
  },
}
