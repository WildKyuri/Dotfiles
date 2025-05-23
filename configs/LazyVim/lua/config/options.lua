vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.list = false

-- Configuración del cursor según el modo
vim.opt.guicursor = {
  "n-v-c:block",   -- Bloque en modo normal, visual y comando
  "i-ci-ve:ver25", -- Barra vertical en modo insertar
  "r-cr:hor20",    -- Línea horizontal en modo reemplazo
  "o:hor50",       -- Línea horizontal más gruesa en modo operador-pending
}

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
