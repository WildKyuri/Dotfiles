local helpers = require("incline.helpers")

require("incline").setup({
  window = {
    padding = 0,
    margin = { horizontal = 0 },
  },
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
    local modified = vim.bo[props.buf].modified
    local buffer = {
      ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
      " ",
      { filename, gui = modified and "bold,italic" or "bold" },
      " ",
      guibg = "#363944",
    }
    return buffer
  end,
})

require("lualine").setup({
  options = {
    -- theme = "moonfly",
    -- theme = "nightfly",
    theme = "molokai",
    -- theme = "iceberg_light",
  },
})

require("noice").setup({
  history = {
    -- usa un buffer normal dentro de un floating window
    view = "popup", -- se puede cambiar a "popup" si quieres más estilo
    opts = {
      enter = true, -- coloca el cursor dentro para copiar
      win_opts = {
        relative = "editor",
        width = 80,
        height = 20,
        row = 2,
        col = 10,
        border = "rounded",
      },
    },
  },
})
