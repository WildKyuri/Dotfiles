return {
  -- luasnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saghen/blink.cmp",
      "rafamadriz/friendly-snippets",
    }, -- Own Snippets
    config = function()
      local ls = require("luasnip")

      -- Cargar snippets friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Cargar nuestros snippets personalizados
      -- require("luasnip.loaders.from_lua").load({ paths = "./lua/plugins/snippets" })
      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/lua/plugins/snippets",
        -- Esta opción es clave para tu estilo de configuración
        export_globals = true,
      })
    end,
  },
}
