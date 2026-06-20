local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--    General Notes
ls.add_snippets("markdown", {
  s("bash", {
    t("```"), -- Primera línea con ```
    i(1, "language"), -- Nodo de inserción para el primer texto
    t({ "", "" }), -- Salto de línea después del primer texto
    i(2, "code"), -- Nodo de inserción para el segundo texto
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
  -- Columnas
  -- Profundidad de 3
  s("obsColsGr3", {
    t("``````col"),
    t({ "", "`````col-md" }),
    t({ "", "" }),
    i(1, "Texto columna 1"),
    t({ "", "`````" }),
    t({ "", "" }),
    t("`````col-md"),
    t({ "", "" }),
    i(2, "Texto columna 2"),
    t({ "", "`````" }),
    t({ "", "``````" }),
  }),
  -- Profundidad de 2
  s("obsColsGr2", {
    t("````col"),
    t({ "", "```col-md" }),
    t({ "", "" }),
    i(1, "Texto columna 1"),
    t({ "", "```" }),
    t({ "", "" }),
    t("```col-md"),
    t({ "", "" }),
    i(2, "Texto columna 2"),
    t({ "", "```" }),
    t({ "", "````" }),
  }),
  -- Plant UML
  s("plantuml", {
    t("```plantuml"),
    t({ "", "!include /home/kyuri/All-in/obsidian/_assets/aurora.puml" }),
    t({
      "",
      "!include https://raw.githubusercontent.com/WildKyuri/Dotfiles/refs/heads/main/configs/plantUML/aurora.puml",
    }),
    t({ "", "@startuml" }),
    t({ "", "" }),
    i(1, "contenido"),
    t({ "", "@enduml" }),
    t({ "", "```" }),
  }),
  s("pumlInclude", {
    t("!include /home/kyuri/All-in/obsidian/_assets/aurora.puml"),
    t({
      "",
      "!include https://raw.githubusercontent.com/WildKyuri/Dotfiles/refs/heads/main/configs/plantUML/aurora.puml",
    }),
  }),
})
