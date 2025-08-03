local ls = require("luasnip")

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
