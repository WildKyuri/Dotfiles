local servers_config = require("config.lsp_servers")

local none_ls = require("null-ls")
local formatting = none_ls.builtins.formatting
local servers = servers_config.lsp_servers
-- Función para deshabilitar formateo si el archivo contiene 'mermaid'

none_ls.setup({
  sources = {

    formatting.stylua, -- Lua
    formatting.prettierd, -- JavaScript/TypeScript, HTML, CSS
    -- formatting.eslint_d,     -- JavaScript/TypeScript con ESLint
    formatting.black, -- Python
    formatting.clang_format, -- C/C++
    formatting.csharpier, -- C#
    formatting.google_java_format, -- Java
  },
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
            augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })
            augroup END
          ]])
    end
  end,
})
