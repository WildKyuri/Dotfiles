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
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local opts = { noremap = true, silent = true }

        -- Keybindings de LSP
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

        -- Puedes agregar más keybindings aquí según tus necesidades
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configuración de servidores LSP
      local servers = {
        "tsserver",
        "cssls",
        "tailwindcss",
        "html",
        "jsonls",
        "eslint",
        "pyright",
        "clangd",
        "csharp_ls",
        "intelephense",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init()
    end,
  },
}
