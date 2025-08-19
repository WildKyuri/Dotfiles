local servers = require("config.lsp_servers")

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("config.conf-plugs.dap")

    -- Configurar adaptadores DAP
    require("mason-nvim-dap").setup({
      -- ensure_installed = vim.tbl_values(servers.lsp_to_dap),
      ensure_installed = servers.lsp_to_dap,
      automatic_installation = true,
      handlers = {
        function(config)
          -- Handler por defecto para todos los adaptadores
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })
  end,
}
