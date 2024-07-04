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

      -- Función on_attach para configurar keybindings específicos de LSP
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local opts = { noremap = true, silent = true }

        -- Keybindings de LSP
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

        -- Puedes agregar más keybindings aquí según tus necesidades
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
