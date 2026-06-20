local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local snacks = require("snacks")
local ls = require("luasnip")
local dap = require("dap")

-- =========================================================
-- LSP GLOBAL KEYMAPS
-- Se activan automáticamente cuando cualquier LSP se conecta
-- =========================================================

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufnr = event.buf

    local lsp_opts = function(desc)
      return {
        noremap = true,
        silent = true,
        buffer = bufnr,
        desc = desc,
      }
    end

    -- hover / documentación
    keymap.set("n", "K", vim.lsp.buf.hover, lsp_opts("lsp: hover documentation"))

    -- signature help
    keymap.set("n", "K", vim.lsp.buf.hover, lsp_opts("lsp: hover documentation"))

    keymap.set({ "n", "i" }, "<leader>sdd", function()
      vim.lsp.buf.signature_help()
    end, lsp_opts("lsp: signature help"))

    -- navegación
    keymap.set("n", "<leader>cf", vim.lsp.buf.definition, lsp_opts("Código: ir a definición"))
    keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, lsp_opts("Código: ir a declaración"))
    keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, lsp_opts("Código: ir a implementación"))
    keymap.set("n", "<leader>cr", vim.lsp.buf.references, lsp_opts("Código: referencias"))

    -- acciones
    keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, lsp_opts("lsp: code action"))
    keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, lsp_opts("lsp: code action"))
  end,
})

-- =========================================================
-- Treesitter
-- =========================================================

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
      markdown = true,
      help = true,
    },
  })
end, opts)

-- =========================================================
-- Oil
-- =========================================================

keymap.set("n", "-", ":Oil<Return>", opts)

-- =========================================================
-- Markdown Preview
-- =========================================================

keymap.set("n", "<Leader>m", ":MarkdownPreviewToggle<CR>", opts)

-- =========================================================
-- Five Server
-- =========================================================

keymap.set("n", "<Leader>fs", ":FiveServer start<CR>", opts)
keymap.set("n", "<Leader>fss", ":FiveServer stop<CR>", opts)

-- =========================================================
-- Databases
-- =========================================================

keymap.set("n", "<Leader>db", "<cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>", opts)

-- =========================================================
-- Aerial
-- =========================================================

keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", opts)
keymap.set("n", "{", "<cmd>AerialPrev<CR>", opts)
keymap.set("n", "}", "<cmd>AerialNext<CR>", opts)

-- =========================================================
-- LuaSnip
-- =========================================================

keymap.set({ "i", "s" }, "<c-d>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

keymap.set({ "i", "s" }, "<c-a>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- =========================================================
-- DAP NVIM
-- =========================================================

keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

keymap.set("n", "<leader>b", dap.toggle_breakpoint, {
  desc = "Debug: Toggle Breakpoint",
})

keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, {
  desc = "Debug: Set Conditional Breakpoint",
})

-- =========================================================
-- Gitsigns
-- =========================================================

keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)

-- =========================================================
-- Snipe
-- =========================================================

keymap.set("n", "<S-l>", function()
  require("snipe").open_buffer_menu()
end, opts)
