local M = {}

M.transparency = function()
  local transparent = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "FloatFooter",
    "SignColumn",
    "EndOfBuffer",
    "FoldColumn",
    "Pmenu",
    "PmenuSbar",
    "PmenuThumb",
  }
  for _, group in ipairs(transparent) do
    vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
  end
  vim.cmd("highlight LazyNormal guibg=NONE ctermbg=NONE")
  vim.cmd("highlight MasonNormal guibg=NONE ctermbg=NONE")
  vim.cmd("highlight TelescopeNormal guibg=NONE ctermbg=NONE")
  vim.cmd("highlight TelescopeBorder guibg=NONE ctermbg=NONE")
  vim.cmd("highlight WhichKeyFloat guibg=NONE ctermbg=NONE")

  vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = "#FFA8FD", -- el color que quieras
    bold = false,
  })
  vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#ff6666" })
  vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#ffaa00" })
  vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "#aaffaa" })
  vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "#aaaaff" })
end

M.markdown = function()
  vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#7ee2ff", bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#a9ffe0", bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#e9a7ff", bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#ff9de2", bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#ffe066", bold = true })
  vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#aaffaa", bold = true })
  vim.api.nvim_set_hl(0, "@punctuation.special.markdown", { fg = "#7ee2ff", bold = true })
  vim.api.nvim_set_hl(0, "@markup.strong", { bold = true, fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "@markup.italic", { italic = true, fg = "#e9a7ff" })
  vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { fg = "#7ee2ff", bg = "NONE" })
  vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { fg = "#a9ffe0", underline = true })
  vim.api.nvim_set_hl(0, "@markup.link.url", { fg = "#7ee2ff", underline = true })
  vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = "#e933e3" })
  vim.api.nvim_set_hl(0, "@markup.quote.markdown", { fg = "#aaaaaa", italic = true })
end

M.setup = function()
  M.transparency()
  M.markdown()
end

return M
