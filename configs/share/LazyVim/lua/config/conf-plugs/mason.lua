local servers_config = require("config.lsp_servers")
local lspconfig = require("lspconfig")
local blink_cmp = require("blink.cmp")
local servers = servers_config.lsp_servers

-- Mostrar errores en línea, con signos y subrayado
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Disminuye el tiempo para que CursorHold se dispare más rápido (popup flotante)
vim.o.updatetime = 300

local on_attach = function(client, bufnr)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {
        focusable = false,
        border = "rounded",
        source = "always",
        prefix = " ",
      })
    end,
  })

  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

-- Configurar cada servidor LSP
for _, server_name in ipairs(servers) do
  local server_config = {
    on_attach = on_attach,
    capabilities = blink_cmp.get_lsp_capabilities(),
  }

  -- Añadir configuraciones especiales si existen
  if servers_config.special_configs[server_name] then
    server_config = vim.tbl_deep_extend("force", server_config, servers_config.special_configs[server_name])
  end

  lspconfig[server_name].setup(server_config)
end
