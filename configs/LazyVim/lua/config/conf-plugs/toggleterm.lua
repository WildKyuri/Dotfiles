require("toggleterm").setup({
  size = 20,
  open_mapping = [[<C-\>]],
  start_in_insert = true,
  float_opts = {
    border = "rounded",
    width = 80,
    height = 35,
    -- winblend = 20,
    row = math.max(1, vim.o.lines * 0.05),
    col = 100,
  },
  direction = "float",
})
local Terminal = require("toggleterm.terminal").Terminal

-- Terminales personalizadas
local terminals = {
  one = Terminal:new({ hidden = true, direction = "float" }),
  two = Terminal:new({ hidden = true, direction = "float" }),
  three = Terminal:new({ hidden = true, direction = "float" }),
}

-- Funciones para alternar cada una
function _TERM_ONE_TOGGLE()
  terminals.one:toggle()
end

function _TERM_TWO_TOGGLE()
  terminals.two:toggle()
end

function _TERM_THREE_TOGGLE()
  terminals.three:toggle()
end
