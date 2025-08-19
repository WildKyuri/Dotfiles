local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local snacks = require("snacks")
local ls = require("luasnip")
local dap = require("dap")

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

-- Oil
keymap.set("n", "-", ":Oil<Return>", opts)

-- Atajo para abrir o actualizar la vista previa de Markdown
keymap.set("n", "<Leader>m", ":MarkdownPreviewToggle<CR>", opts)

-- Five Server
keymap.set("n", "<Leader>fs", ":FiveServer start<CR>", opts)
keymap.set("n", "<Leader>fss", ":FiveServer stop<CR>", opts)

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
keymap.set("i", "<A-d>", toggle_signature_help, { silent = true, desc = "Toggle signature help (insert)" })
keymap.set("n", "<A-d>", toggle_signature_help, { silent = true, desc = "Toggle signature help (normal)" })

-- Dap nvim
keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" }) --> Iniciar/Continuar
keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" }) --> Ejecuta sin entrar en funciones
keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" }) --> Entra dentro de funciones
keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" }) --> Sale de la funcion actual
keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" }) --> Breakpoint
keymap.set("n", "<leader>B", function() --> Breakpoint condicional
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Conditional Breakpoint" })

-- Gitsigns
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
