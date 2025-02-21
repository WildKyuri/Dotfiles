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

      require("luasnip.loaders.from_vscode").lazy_load()

      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- HTML
      ls.add_snippets("html", {
        s("lazyPicture", {
          t("<picture>"),
          t({ "", '  <source srcset="build/img/' }),
          i(4, "cursor3.webp"),
          t('" type="image/webp" />'),
          t({ "", '  <source srcset="build/img/' }),
          i(3, "cursor4.avif"),
          t('" type="image/avif" />'),
          t({ "", '  <img loading="lazy" src="build/img/' }),
          i(1, "cursor1.jpg"),
          t('" alt="'),
          i(2, "cursor2"),
          t('" />'),
          t({ "", "</picture>" }),
        }),
      })

      -- PHP
      ls.add_snippets("php", {
        s("php", {
          t({ "<?php" }),
          t({ "", "  " }),
          i(1, ""),
          t({ "", "?>" }),
        }),
        s("pre", {
          t('echo "<pre>";'),          -- Primera línea con comillas y texto
          t({ "", "  " }),             -- Salto de línea
          i(1, ""),                    -- Nodo de inserción para más código
          t({ "", 'echo "</pre>";' }), -- Línea final con comillas y texto
        }),
      })

      --    Obsidian
      ls.add_snippets("markdown", {
        --    General Notes
        s("bash", {
          t("```"),         -- Primera línea con ```
          i(1, "language"), -- Nodo de inserción para el primer texto
          t({ "", "" }),    -- Salto de línea después del primer texto
          i(2, "code"),     -- Nodo de inserción para el segundo texto
          t({ "", "```" }), -- Última línea con ```
        }),
        --tables
        s("sheet", {
          t("```sheet"),
          t({ "", "" }),
          i(1, "table"),
          t({ "", "```" }),
        }),
        -- Links
        s("linkArchivos", {
          t("[["),
          i(1),
          t("]]"),
        }),
        -- Mostrar Contenido de Archivos
        s("linkVisualizer", {
          t("![["),
          i(1),
          t("]]"),
        }),
        --    Obsidian LaTex Suite
        -- $$  $$
        s("mk", {
          t("$$\\Large "),
          i(1),
          t("$$"),
        }),
        -- $$ \n $$
        s("dm", {
          t({ "$$\\Large", "" }), -- Primera línea con $$ y un salto de línea
          i(1),                   -- Nodo de inserción con un texto por defecto
          t({ "", "$$" }),        -- Última línea con $$
        }),
        -- ^{2}
        s("exp2", {
          i(1),
          t("^{2}"),
        }),
        -- ^{3}
        s("exp3", {
          i(1),
          t("^{3}"),
        }),
        -- ^{}
        s("exp", {
          i(1),
          t("^{"),
          i(2),
          t("}"),
        }),
        -- _^{}
        s("sub", {
          i(1),
          t("_{"),
          i(2),
          t("}"),
        }),
        -- Division
        s("frac", {
          t("\\frac{"),
          i(1),
          t("}{"),
          i(2),
          t("}"),
        }),
        -- \bar_{x} ---> promedio
        s("promedio", {
          t("\\bar{"),
          i(1),
          t("}"),
        }),
        -- \sqrt{} ---> Raiz
        s("raiz", {
          t("\\sqrt{"),
          i(1),
          t("}"),
        }),
        -- \int_{}^{} ----> integral Definida
        s("integralDef", {
          t("\\int_{"),
          i(1),
          t("}^{"),
          i(2),
          t("}"),
        }),
        -- \int ---> integral
        s("integralIndef", {
          t("\\int"),
        }),
        -- \text ---> texto
        s("text", {
          t("\\text{"),
          i(1),
          t("}"),
        }),
        -- \quadd ---> Espacio Grande
        s("spaceBig", {
          t("\\qquad"),
        }),
        -- \space ---> Espacio normal
        s("space", {
          t("\\space"),
        }),
        -- Parenthesis/brackets
        s("Parenthesis", {
          t("\\left( "),
          i(1),
          t(" \\right) "),
        }),
        s("brackets", {
          t("\\left[ "),
          i(1),
          t(" \\right] "),
        }),
        -- \cdot ---> multiplicacion
        s("dot", {
          t("\\diamond"),
        }),

        --    Mermaid
        s("mermaid", {
          t("```mermaid"),
          t({ "", "" }),
          i(1, "code"),
          t({ "", "```" }),
        }),
        s("obsHorizontal", {
          t("flowchart LR"),
        }),
        s("obsVertical", {
          t("flowchart TD"),
        }),
        s("obsSupbgraph", {
          t("subgraph "),
          i(1, "X"),
          t({ ' ["$' }),
          i(2, "X"),
          t({ '$"]' }),
          t({ "", "  " }),
          i(3, "Aqui escribe"),
          t({ "", "end" }),
        }),
        -- Columnas
        s("obsCols", {
          t("`````col"),
          t({ "", "````col-md" }),
          t({ "", "" }),
          i(1, "Texto columna 1"),
          t({ "", "````" }),
          t({ "", "" }),
          t("````col-md"),
          t({ "", "" }),
          i(2, "Texto columna 2"),
          t({ "", "````" }),
          t({ "", "`````" }),
        }),
      })
    end,
  },
}
