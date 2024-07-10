local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local ls = require("luasnip")

keymap.set("n", "x", '"_x')

--        telescope
-- Atajo para buscar archivos
keymap.set("n", "<Leader>ff", function()
  builtin.find_files({})
end, opts)

-- Atajo para búsqueda en vivo (live grep)
keymap.set("n", "<Leader>fg", function()
  builtin.live_grep({})
end, opts)

-- Atajo para listar buffers
keymap.set("n", "<Leader>fb", function()
  builtin.buffers({})
end, opts)

-- Atajo para búsqueda de tags de ayuda
keymap.set("n", "<Leader>fh", function()
  builtin.help_tags({})
end, opts)
-- Atajo para Treesitter
keymap.set("n", "<Leader>ft", builtin.treesitter, opts)

-- Select all
keymap.set("n", "<Leader>ad", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Neo tree
keymap.set("n", "<Leader>o", ":Neotree focus<CR>", opts)

-- Auto Session Lens
keymap.set("n", "<Leader>las", require("auto-session.session-lens").search_session, {
  noremap = true,
})

-- Terminal
keymap.set("n", "<Leader>th", ":ToggleTerm direction=horizontal<CR>", opts)

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<Leader>dc", ":tabclose<CR>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Oil
keymap.set("n", "-", ":Oil<Return>", opts)

-- Atajo para abrir o actualizar la vista previa de Markdown
keymap.set("n", "<Leader>m", ":MarkdownPreviewToggle<CR>", opts)
keymap.set("n", "<Leader>mc", ":MarkdownPreviewClose<CR>", opts)

-- Regresar al dashboard
keymap.set("n", "<Leader>gd", ":Dashboard<CR>", opts)

-- Live Server
keymap.set("n", "<Leader>ls", ":LiveServerStart<CR>", opts)
keymap.set("n", "<Leader>le", ":LiveServerStop<CR>", opts)

-- Databases
keymap.set("n", "<Leader>db", "<cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>")

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

-- Delete Buffers except the actual one
local status_bufdelete, bufdelete = pcall(require, "bufdelete")
if status_bufdelete then
  keymap.set("n", "<Leader>bo", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
      if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
        bufdelete.bufdelete(buf, true)
      end
    end
  end, opts)
else
  print("bufdelete.nvim not found")
end
