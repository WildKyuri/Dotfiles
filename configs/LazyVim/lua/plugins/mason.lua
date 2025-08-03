local servers_config = require("config.lsp_servers")

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers_config.lsp_servers,
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    after = { "mason.nvim", "none-ls.nvim" },
    opts = {
      ensure_installed = servers_config.null_servers,
      -- automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- after = "mason-lspconfig.nvim",
    dependencies = { "saghen/blink.cmp" },
    config = function()
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
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local none_ls = require("null-ls")
      local formatting = none_ls.builtins.formatting
      local servers = servers_config.lsp_servers
      -- Función para deshabilitar formateo si el archivo contiene 'mermaid'

      none_ls.setup({
        sources = {
          formatting.stylua,             -- Lua
          formatting.prettierd,          -- JavaScript/TypeScript, HTML, CSS
          -- formatting.eslint_d,     -- JavaScript/TypeScript con ESLint
          formatting.black,              -- Python
          formatting.clang_format,       -- C/C++
          formatting.csharpier,          -- C#
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
    end,
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init()
    end,
  },
  {
    "olrtg/nvim-emmet",
  },
}
