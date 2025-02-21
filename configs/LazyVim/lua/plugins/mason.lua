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
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- LSP Languajes
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
          "emmet_language_server",
          "texlab",
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    after = { "mason.nvim", "none-ls.nvim" },
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",
        "eslint_d",
        "black",
        "clang_format",
        "csharpier",
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local lspconfig = require("lspconfig")
      local blink_cmp = require("blink.cmp")

      -- Función para configurar keymaps al adjuntar el cliente LSP
      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local opts = { noremap = true, silent = true }

        -- Keybindings para LSP
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

        -- Puedes agregar más keybindings aquí según tus necesidades
      end

      -- Obtener las capacidades de `blink.cmp` para autocompletado
      local capabilities = blink_cmp.get_lsp_capabilities()

      -- Lista de servidores LSP
      local servers = {
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
        "emmet_language_server",
        "texlab",
      }

      -- Configurar cada servidor LSP
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local none_ls = require("null-ls")
      local formatting = none_ls.builtins.formatting
      -- Función para deshabilitar formateo si el archivo contiene 'mermaid'

      none_ls.setup({
        sources = {
          formatting.stylua, -- Lua
          formatting.prettierd, -- JavaScript/TypeScript, HTML, CSS
          -- formatting.eslint_d,     -- JavaScript/TypeScript con ESLint
          formatting.black, -- Python
          formatting.clang_format, -- C/C++
          formatting.csharpier, -- C#

          formatting.prettierd, -- JavaScript/TypeScript, HTML, CSS
        },
        on_attach = function(client)
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
            augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })
            augroup END
          ]])
          end
        end,
      })
    end,
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init()
    end,
  },
  {
    "olrtg/nvim-emmet",
  },
}
