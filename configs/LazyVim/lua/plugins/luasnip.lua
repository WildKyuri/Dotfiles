return {
  -- luasnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saghen/blink.cmp",
      "rafamadriz/friendly-snippets",
    },
    -- Own Snippets
    -- config = function ()
    --   local ls = require "luasnip"
    --   local s = ls.snippet
    --   local t = ls.text_node
    --   local i = ls.insert_node

    -- HTML
    -- ls.add_snippets("html", {
    --    s("lazyPicture", {
    --      t("<picture>"),
    --      t({"", "  <source srcset=\"build/img/"}), i(4, "cursor3.webp"), t("\" type=\"image/webp\" />"),
    --      t({"", "  <source srcset=\"build/img/"}), i(3, "cursor4.avif"), t("\" type=\"image/avif\" />"),
    --      t({"", "  <img loading=\"lazy\" src=\"build/img/"}), i(1, "cursor1.jpg"), t("\" alt=\""), i(2, "cursor2"), t("\" />"),
    --      t({"", "</picture>"}),
    -- t({"", "  <source srcset=\""}), i(3, "build/img/cursor3.webp"), t("\" type=\"image/webp\" />"),
    -- t({"", "  <source srcset=\""}), i(4, "build/img/cursor4.avif"), t("\" type=\"image/avif\" />"),
    -- t({"", "  <img loading=\"lazy\" src=\""}), i(1, "build/img/cursor1.jpg"), t("\" alt=\""), i(2, "cursor2"), t("\" />"),

    --   }),
    -- })
    -- end
  },
}
