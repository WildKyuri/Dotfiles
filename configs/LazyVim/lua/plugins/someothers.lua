return {
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    pattern = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "KyuriNotes",
          path = "/mnt/d/OBSIDIAN/",
        },
      },
      disable_frontmatter = true,
      disable_autocommands = true, -- Desactiva los autocomandos por defecto
      notes_subdir = "03 limbo",
      templates = {
        subdir = "99 Meta/Templates",
      },
    },
  },
}
