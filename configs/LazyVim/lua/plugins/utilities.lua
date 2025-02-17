return {
  { "mg979/vim-visual-multi" }, -- Multiline Editing
  --            Markdown preview
  {
    -- Install markdown preview, use npx if available.
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable("npx") then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd([[Lazy load markdown-preview.nvim]])
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable("npx") then
        vim.g.mkdp_filetypes = { "markdown" }
      end
    end,
  },
  --            Notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      background_colour = "#000000",
      render = "wrapped-compact",
    },
  },
  --             BufferLine
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  --              filename
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "BufReadPre",
    priority = 1200,
    config = function()
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
    end,
  },
  --              Databases
  {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  -- LiveServer
  {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
      require("live-server").setup({
        args = {
          "--browser=firefox",
        },
      })
    end,
  },
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  -- Auto Sessions
  {
    "rmagatti/auto-session",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
    },
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = {
          "~/",
          "~/Projects",
          "~/Downloads",
          "/",
        },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
          buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
        },
      })
    end,
  },
}
