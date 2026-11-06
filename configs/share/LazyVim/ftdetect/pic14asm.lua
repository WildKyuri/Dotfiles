-- Detección del filetype para fuentes PIC14 (MPASM / gpasm).
-- Si el archivo no muestra señales de PIC, se deja como "asm" (x86 y otros).

local function read_head(path)
  local fd = io.open(path, "r")
  if not fd then
    return nil
  end
  local lines = {}
  for i = 1, 40 do
    local line = fd:read("*l")
    if not line then
      break
    end
    lines[i] = line
  end
  fd:close()
  return table.concat(lines, "\n")
end

local function looks_like_pic14(path, bufnr)
  local text
  if bufnr and bufnr > 0 and vim.api.nvim_buf_is_valid(bufnr) then
    local loaded = vim.api.nvim_buf_get_lines(bufnr, 0, 40, false)
    if #loaded > 0 then
      text = table.concat(loaded, "\n")
    end
  end
  text = text or read_head(path)
  if not text or text == "" then
    return false
  end

  text = text:lower()
  return text:match("list%s+[^\n;]*p%s*=%s*%d") ~= nil
    or text:match("processor%s+%d") ~= nil
    or text:match("#%s*include%s*[<\"]p%d+%w*%.inc") ~= nil
    or text:match("__config") ~= nil
end

vim.filetype.add({
  pattern = {
    [".*%.asm"] = function(path, bufnr)
      if looks_like_pic14(path, bufnr) then
        return "pic14asm"
      end
      return nil
    end,
    -- Headers oficiales de gputils: /usr/share/gputils/header/p16f877a.inc
    [".*%.inc"] = function(path, _)
      if path:match("/gputils/header/p%d+%w*%.inc$") then
        return "pic14asm"
      end
      return nil
    end,
  },
})
