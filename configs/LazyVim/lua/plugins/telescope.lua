return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        key = {
          ";f",
          function()
            local builtin = require("telescope.builtin")
            builtin.find_files({
              no_ignore = false,
              hidden = true,
            })
          end,
        },
      })
    end,
  },
}
