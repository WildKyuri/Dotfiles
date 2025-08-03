local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--    Mermaid Obsidian
ls.add_snippets("markdown", {
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
})
