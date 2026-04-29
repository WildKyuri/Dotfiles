local servers_config = require("config.lsp_servers")

return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = servers_config.lsp_servers,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    after = { "mason.nvim", "none-ls.nvim" },
    opts = {
      ensure_installed = servers_config.null_servers,
      -- automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- after = "mason-lspconfig.nvim",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require("config.conf-plugs.mason")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("config.conf-plugs.null_ls")
    end,
  },
}
