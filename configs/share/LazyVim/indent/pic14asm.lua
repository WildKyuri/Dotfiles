-- Indentado para ensamblador PIC14 (MPASM / gpasm).
-- Convención: etiquetas y directivas a columna 0; instrucciones con una sangría.
-- Archivo: ~/.config/nvim/indent/pic14asm.lua

local directives = {}
for word in ([[
  LIST PROCESSOR ORG END EQU SET CBLOCK ENDC INCLUDE
  __CONFIG __IDLOCS __MAXRAM __BADRAM EXPAND NOEXPAND
  ERROR ERRORLEVEL MESSG TITLE SUBTITLE RADIX FILL RES CODE DATA
  UDATA IDATA PAGESEL BANKSEL MACRO ENDM
  IF IFDEF IFNDEF ELSE ENDIF WHILE REPEAT UNTIL
]]):gmatch("%S+") do
  directives[word] = true
end

local function indentation(lnum)
  lnum = lnum or vim.v.lnum
  if lnum <= 1 then
    return 0
  end

  local line = vim.fn.getline(lnum)
  local trimmed = line:match("^%s*(.-)%s*$")

  if trimmed == "" then
    return 0
  end

  -- Comentario solo: se alinea con la línea anterior.
  if trimmed:sub(1, 1) == ";" then
    return vim.fn.indent(lnum - 1)
  end

  -- Preprocesador (#include, #define...).
  if trimmed:sub(1, 1) == "#" then
    return 0
  end

  -- Etiqueta: nombre seguido de dos puntos.
  if trimmed:match("^[%a_][%w_]*%s*:") then
    return 0
  end

  -- Directiva al inicio de la línea.
  local first = trimmed:match("^([%a_][%w_]*)")
  if first and directives[first:upper()] then
    return 0
  end

  -- Definición con EQU: NOMBRE EQU valor.
  if trimmed:match("^[%a_][%w_]*%s+[Ee][Qq][Uu]%s") then
    return 0
  end

  -- Cualquier otra cosa es una instrucción.
  return vim.fn.shiftwidth()
end

_G.Pic14asmIndent = indentation

vim.bo.indentexpr = "v:lua.Pic14asmIndent()"
vim.bo.indentkeys = "!^F,o,O,e"
vim.bo.autoindent = true
vim.bo.smartindent = false
