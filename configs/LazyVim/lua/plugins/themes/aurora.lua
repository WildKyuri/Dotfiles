return {
  {
    "ray-x/aurora",
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    config = function()
      local aurora = require("config.conf-plugs.aurora")

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "aurora",
        callback = aurora.setup,
      })

      vim.cmd.colorscheme("aurora")
      aurora.setup()
    end,
  },
}
