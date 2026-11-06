-- Ajustes de buffer para fuentes PIC14 (MPASM / gpasm).
-- Archivo: ~/.config/nvim/ftplugin/pic14asm.lua

vim.bo.commentstring = "; %s"
vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.autoindent = true
vim.bo.smartindent = false
vim.bo.textwidth = 0

local tools = "/opt/tools-pic"
local pic_asm = tools .. "/pic-asm"

---@param result table
---@return table[] items
local function quickfix_items(result)
  local output = (result.stdout or "") .. "\n" .. (result.stderr or "")
  local items = {}
  for _, line in ipairs(vim.split(output, "\n")) do
    local file, lnum, message = line:match("^(.-):(%d+):(.*)$")
    if file and lnum then
      table.insert(items, {
        filename = file,
        lnum = tonumber(lnum),
        text = vim.trim(message),
        type = message:match("Warning") and "W" or "E",
      })
    end
  end
  return items
end

local function build()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("Guarda el archivo antes de ensamblar.", vim.log.levels.WARN)
    return
  end
  if vim.fn.executable(pic_asm) ~= 1 then
    vim.notify("No encuentro " .. pic_asm, vim.log.levels.ERROR)
    return
  end

  vim.cmd("silent write")
  local dir = vim.fn.fnamemodify(file, ":h")
  vim.system({ pic_asm, file }, { text = true, cwd = dir }, function(result)
    vim.schedule(function()
      local output = ((result.stdout or "") .. (result.stderr or "")):gsub("%s+$", "")
      local items = quickfix_items(result)
      if #items > 0 then
        vim.fn.setqflist(items, "r")
        vim.cmd("copen")
      end
      if result.code == 0 then
        vim.notify(output, vim.log.levels.INFO)
      else
        vim.notify("gpasm falló. Revisa la lista de errores.", vim.log.levels.ERROR)
      end
    end)
  end)
end

local function open_simulide()
  local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
  local circuits = vim.fn.glob(dir .. "/*.sim1", false, true)
  local cmd = { "simulide" }
  if #circuits > 0 then
    table.insert(cmd, circuits[1])
  end
  vim.system(cmd, { detach = true })
end

local function show_devices()
  vim.system({ pic_asm, "--devices" }, { text = true }, function(result)
    vim.schedule(function()
      vim.notify((result.stdout or result.stderr or ""):gsub("%s+$", ""), vim.log.levels.INFO, {
        title = "PIC16 en SimulIDE",
      })
    end)
  end)
end

vim.api.nvim_buf_create_user_command(0, "PicAsmBuild", build, {
  desc = "Ensamblar el fuente PIC y generar el .hex",
})
vim.api.nvim_buf_create_user_command(0, "PicAsmSimulide", open_simulide, {
  desc = "Abrir SimulIDE con el circuito .sim1 de la carpeta",
})
vim.api.nvim_buf_create_user_command(0, "PicAsmDevices", show_devices, {
  desc = "Listar los PIC16 que simula SimulIDE",
})

vim.keymap.set("n", "<localleader>b", build, { buffer = 0, desc = "Ensamblar PIC (.hex)" })
vim.keymap.set("n", "<localleader>s", open_simulide, { buffer = 0, desc = "Abrir SimulIDE" })
vim.keymap.set("n", "<localleader>?", show_devices, { buffer = 0, desc = "PIC16 en SimulIDE" })
