return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  opts = {
    ensure_installed = {
      "markdown",
      "tsx",
      "typescript",
      "javascript",
      "toml",
      "c_sharp",
      "json",
      "yaml",
      "rust",
      "css",
      "html",
      "lua",
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  },
}
