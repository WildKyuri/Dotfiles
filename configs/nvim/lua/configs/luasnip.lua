local status, ls = pcall(require, "luasnip")

if not status then
    return
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Keybindings
  -- <ctrl-d> is my expansion key
  -- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-d>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- <ctrl-a> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-a>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })


-- Add ur own snippets 
--ls.add_snippets("css", {
--    s("mq", {
--        t('@include name()')
--    })
--})



