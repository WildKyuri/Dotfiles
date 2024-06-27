return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "tailwindcss",
        "cssls",
        "html",
        "eslint",
        "jsonls",
        "tsserver",
        "intelephense",
        "pyright",
        "clangd",
        "csharp_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    config = function()
      local lspconfig = require("lspconfig")
      local protocol = require("vim.lsp.protocol")
      local on_attach = function(client, bufnr)
      -- Activar formateo al guardar si el servidor lo soporta
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command("augroup LspFormat")
        vim.api.nvim_command("autocmd!")
        vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        vim.api.nvim_command("augroup END")
        end
      end
      -- TypeScript
      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- CSS
      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Tailwind
      lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- HTML
      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- JSON
      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Eslint
      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Python
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- C/C++
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- C#
      lspconfig.csharp_ls.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- PHP
      lspconfig.intelephense.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },
  {
    "onsails/lspkind-nvim",
  },
}

