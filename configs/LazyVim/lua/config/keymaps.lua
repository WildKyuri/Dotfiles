local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local snacks = require("snacks")
local ls = require("luasnip")

keymap.set("n", "x", '"_x')

--      Snacks Picker
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
  snacks.picker.files({
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

--  Treesitter
keymap.set("n", "<Leader>ft", function()
  snacks.picker.treesitter({
    finder = "treesitter_symbols",
    tree = true,
    filter = {
      default = {
        "Class",
        "Enum",
        "Field",
        "Function",
        "Method",
        "Module",
        "Namespace",
        "Struct",
        "Trait",
      },
      -- set to `true` to include all symbols
      markdown = true,
      help = true,
    },
  })
end, opts)

-- Select all
keymap.set("n", "<Leader>ad", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Sncacks Explorer
keymap.set("n", "<leader>e", function()
  require("snacks.explorer").open()
end, { desc = "Abrir explorer de Snacks" })

-- Auto Session Lens
keymap.set("n", "<Leader>las", require("auto-session.session-lens").search_session, {
  noremap = true,
})

-- Terminal
keymap.set("n", "<Leader>tf", ":ToggleTerm direction=horizontal size=15<CR>", opts)
keymap.set("n", "<Leader>/", ":ToggleTerm direction=float<CR>", opts)

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Cambiar entre buffers
keymap.set("n", "nb", ":bnext<CR>", opts)
keymap.set("n", "nB", ":bprev<CR>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<Left>", "<C-w>>")
keymap.set("n", "<Right>", "<C-w><")
keymap.set("n", "<Up>", "<C-w>-")
keymap.set("n", "<Down>", "<C-w>+")

-- Moverse en modo inserción
keymap.set("i", "<C-h>", "<Left>", opts)  -- Izquierda
keymap.set("i", "<C-j>", "<Down>", opts)  -- Abajo
keymap.set("i", "<C-k>", "<Up>", opts)    -- Arriba
keymap.set("i", "<C-l>", "<Right>", opts) -- Derecha

-- Oil
keymap.set("n", "-", ":Oil<Return>", opts)

-- Atajo para abrir o actualizar la vista previa de Markdown
keymap.set("n", "<Leader>m", ":MarkdownPreviewToggle<CR>", opts)

-- Regresar al dashboard
keymap.set("n", "<Leader>gd", ":Dashboard<CR>", opts)

-- Five Server
keymap.set("n", "<Leader>fs", ":FiveServer start<CR>", opts)
keymap.set("n", "<Leader>fse", ":FiveServer stop<CR>", opts)

-- Databases
keymap.set("n", "<Leader>db", "<cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>")

-- Aerial
keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", opts)
keymap.set("n", "{", "<cmd>AerialPrev<CR>", opts)
keymap.set("n", "}", "<cmd>AerialNext<CR>", opts)

-- Saltar en los snippets
keymap.set({ "i", "s" }, "<c-d>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <ctrl-a> is my jump backwards key.
-- this always moves to the previous item within the snippet
keymap.set({ "i", "s" }, "<c-a>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Signature help (documentación de parámetros de función)
-- Modo insert: cuando estás dentro de los paréntesis
-- keymap.set("i", "<A-g>", vim.lsp.buf.signature_help, { silent = true, desc = "Signature help (insert)" })

-- Modo normal: sobre el nombre de la función
-- keymap.set("n", "<A-g>", vim.lsp.buf.signature_help, { silent = true, desc = "Signature help (normal)" })

-- Toggle para signature help
local function toggle_signature_help()
  -- Busca si ya hay una ventana flotante de signature_help abierta
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "lspinfo" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  -- Si no la encontramos, abrimos signature_help
  vim.lsp.buf.signature_help()
end

-- Asignamos la misma tecla para togglear
keymap.set("i", "<A-g>", toggle_signature_help, { silent = true, desc = "Toggle signature help (insert)" })
keymap.set("n", "<A-g>", toggle_signature_help, { silent = true, desc = "Toggle signature help (normal)" })
