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
    "emmet_ls",
    "pyright",
    "clangd",
    "csharp_ls",
    "jdtls",
    "bashls",
  },

  null_servers = {
    "stylua",
    "prettierd",
    "black",
    "clang_format",
    "csharpier",
    "google-java-format",
  },

  -- Mapeo de LSP a DAP (para debugging.lua)
  lsp_to_dap = {
    python3 = "debugpy",  -- Python
    csharp = "netcoredbg",
    cpp = "codelldb",     -- C/C++
    c = "cpp",
    "js-debug-adapter",   -- JavaScript/TypeScript
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
    emmet_ls = {
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "php", -- ✅ activa Emmet en PHP
      },
    },
  },
}
