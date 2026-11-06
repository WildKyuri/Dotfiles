-- LSP propio para ensamblador PIC14: /opt/tools-pic/pic-asm-lsp
-- Se registra con la API nativa de Neovim (0.11+), sin Mason.

local server = "/opt/tools-pic/pic-asm-lsp"

if vim.fn.executable(server) == 1 and vim.lsp and vim.lsp.config and vim.lsp.enable then
  vim.lsp.config("pic14asm", {
    cmd = { server },
    filetypes = { "pic14asm" },
    root_dir = function(bufnr, on_dir)
      local name = vim.api.nvim_buf_get_name(bufnr)
      on_dir(name ~= "" and vim.fs.dirname(name) or nil)
    end,
    single_file_support = true,
  })
  vim.lsp.enable("pic14asm")
end
