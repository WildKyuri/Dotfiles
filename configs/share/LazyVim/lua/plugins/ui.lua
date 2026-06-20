return {
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "BufReadPre",
    priority = 1200,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("config.conf-plugs.toggleterm")
    end,
  },
}
