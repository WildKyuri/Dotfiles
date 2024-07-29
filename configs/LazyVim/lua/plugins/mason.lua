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
          "lua_ls",
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
          "emmet_language_server",
          "texlab",
        },
      })
    end
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
