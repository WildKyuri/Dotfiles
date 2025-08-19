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

-- Función para configurar keymaps al adjuntar el cliente LSP
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }

  -- Keybindings para LSP
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  -- Puedes agregar más keybindings aquí según tus necesidades
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
