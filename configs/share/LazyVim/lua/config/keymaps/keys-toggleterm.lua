local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Terminal principal (flotante con color diferente)
keymap.set("n", "<Leader>/", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local main_term = Terminal:new({})
  main_term:toggle()
end, opts)

-- Terminales persistentes 1, 2 y 3
keymap.set("n", "<Leader>1", ":1ToggleTerm<CR>", opts)
keymap.set("n", "<Leader>2", ":2ToggleTerm<CR>", opts)
keymap.set("n", "<Leader>3", ":3ToggleTerm<CR>", opts)

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
