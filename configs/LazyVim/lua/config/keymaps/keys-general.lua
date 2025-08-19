local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Select all
keymap.set("n", "<Leader>ad", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

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
keymap.set("i", "<C-h>", "<Left>", opts) -- Izquierda
keymap.set("i", "<C-j>", "<Down>", opts) -- Abajo
keymap.set("i", "<C-k>", "<Up>", opts) -- Arriba
keymap.set("i", "<C-l>", "<Right>", opts) -- Derecha

-- Notifications
keymap.set("n", "<leader>n", function()
  require("noice").cmd("history")
end, { desc = "Noice: Open history" })
