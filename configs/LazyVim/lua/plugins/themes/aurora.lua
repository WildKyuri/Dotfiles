-- return {
--   -- lazy
--   {
--     "ray-x/aurora",
--     init = function()
--       vim.g.aurora_italic = 1
--       vim.g.aurora_transparent = 1
--       vim.g.aurora_bold = 1
--     end,
--     config = function()
--       vim.cmd.colorscheme("aurora")
--       -- override defaults
--       vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
--     end,
--   },
-- }

-- return {
--   {
--     "ray-x/aurora",
--     init = function()
--       vim.g.aurora_italic = 1
--       vim.g.aurora_transparent = 1
--       vim.g.aurora_bold = 1
--     end,
--     config = function()
--       local function aurora_transparency()
--         local transparent = {
--           "Normal",
--           "NormalNC",
--           "NormalFloat",
--           "FloatBorder",
--           "FloatTitle",
--           "FloatFooter",
--           "SignColumn",
--           "EndOfBuffer",
--           "FoldColumn",
--           "Pmenu",
--           "PmenuSbar",
--           "PmenuThumb",
--         }
--
--         for _, group in ipairs(transparent) do
--           vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
--         end
--
--         -- Opcional: algunos plugins
--         vim.cmd("highlight LazyNormal guibg=NONE ctermbg=NONE")
--         vim.cmd("highlight MasonNormal guibg=NONE ctermbg=NONE")
--         vim.cmd("highlight TelescopeNormal guibg=NONE ctermbg=NONE")
--         vim.cmd("highlight TelescopeBorder guibg=NONE ctermbg=NONE")
--         vim.cmd("highlight WhichKeyFloat guibg=NONE ctermbg=NONE")
--
--         -- Tu override
--         -- vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
--         vim.api.nvim_set_hl(0, "CursorLineNr", {
--           fg = "#FFA8FD", -- el color que quieras
--           bold = false,
--         })
--       end
--
--       vim.api.nvim_create_autocmd("ColorScheme", {
--         pattern = "aurora",
--         callback = aurora_transparency,
--       })
--
--       vim.cmd.colorscheme("aurora")
--       aurora_transparency()
--     end,
--   },
-- }

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
