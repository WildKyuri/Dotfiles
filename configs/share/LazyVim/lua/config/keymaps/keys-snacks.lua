local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local snacks = require("snacks")

-----------------------------------
--      Snacks Picker
-----------------------------------

-- Buscar archivos
keymap.set("n", "<Leader><Leader>", function()
  snacks.picker.files({
    finder = "files",
    ignored = true,
    hidden = true,
    show_empty = true,
  })
end, opts)

-- Live Grep
keymap.set("n", "<Leader>fg", function()
  snacks.picker.grep({
    finder = "grep",
    regex = true,
    format = "file",
    show_empty = true,
    live = true, -- live grep by default
    supports_live = true,
  })
end, opts)

-- Buffers
keymap.set("n", "<Leader>fb", function()
  snacks.picker.buffers({
    finder = "buffers",
    sort_lastused = true,
    win = {
      input = {
        keys = {
          ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
        },
      },
      list = { keys = { ["dd"] = "bufdelete" } },
    },
  })
end, opts)

--  Git Log
keymap.set("n", "<Leader>gl", function()
  snacks.picker.git_log({
    finder = "git_log",
    format = "git_log",
    preview = "git_show",
    confirm = "git_checkout",
  })
end, opts)

--  Git status
keymap.set("n", "<Leader>gs", function()
  snacks.picker.git_status({
    finder = "git_status",
    preview = "git_status",
    win = {
      input = {
        keys = {
          ["<Tab>"] = { "git_stage", mode = { "n", "i" } },
        },
      },
    },
  })
end, opts)

keymap.set("n", "<leader>gsd", function()
  require("gitsigns").diffthis()
end, { desc = "Gitsigns: diffthis" })

--  Git Branch
keymap.set("n", "<Leader>gb", function()
  snacks.picker.git_branches({
    layout = "select",
  })
end, opts)

-- Sncacks Explorer
keymap.set("n", "<leader>e", function()
  require("snacks.explorer").open()
end, { desc = "Abrir explorer de Snacks" })

-- Mostrar imagen bajo el cursor manualmente
keymap.set("n", "<leader>pi", function()
  local ok, img = pcall(require, "snacks.image")
  if not ok then
    vim.notify("snacks.image no disponible", vim.log.levels.WARN)
    return
  end
  -- pcall para evitar que un error rompa tu sesión si el backend falla
  pcall(img.hover)
end, { desc = "Snacks: mostrar imagen bajo cursor", noremap = true, silent = true })
