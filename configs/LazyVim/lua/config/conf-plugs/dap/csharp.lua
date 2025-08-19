local dap = require("dap")

-- Configuración de DAP para C#
dap.configurations.cs = {
  {
    type = "netcoredbg",
    request = "launch",
    name = "Launch .NET Core",
    program = function()
      return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
    -- console = "integratedTerminal",
    console = "externalTerminal",
  },
}

-- Picker para elegir DLL de C#
vim.keymap.set("n", "<leader>dll", function()
  -- Determinar el directorio donde buscar DLLs
  local cwd = vim.fn.getcwd() .. "/bin/Debug/"
  if vim.fn.isdirectory(cwd) == 0 then
    cwd = vim.fn.getcwd()
  end

  -- Buscar todos los DLLs
  local dlls = vim.fn.globpath(cwd, "**/*.dll", 0, 1)
  if #dlls == 0 then
    vim.notify("No hay DLL", vim.log.levels.WARN)
    return
  end

  -- Preparar la lista para mostrar
  local lines = vim.tbl_map(function(f)
    return vim.fn.fnamemodify(f, ":.")
  end, dlls)

  -- Crear la ventana flotante con Snacks Picker
  local win = require("snacks.win")({
    position = "float",
    height = math.min(#lines + 1, 12), -- deja espacio para el título
    width = 70,
    title = { { " DLL a depurar ", "FloatTitle" } },
    title_pos = "center",
    border = "rounded",
    style = "minimal", -- sin números de línea, barras, etc.
    bo = { buftype = "nofile", modifiable = true },
    wo = { cursorline = true, winhighlight = "NormalFloat:SnacksNormal,FloatBorder:SnacksPickerBorder" },
  })

  -- Poner la lista de DLLs en la ventana
  vim.api.nvim_buf_set_lines(win.buf, 0, -1, false, lines)
  vim.bo[win.buf].modifiable = false

  -- keymaps
  vim.keymap.set("n", "<CR>", function()
    local l = vim.api.nvim_win_get_cursor(win.win)[1]
    local dll = dlls[l]
    win:close()
    require("dap").run({
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = dll,
      console = "integratedTerminal",
    })
  end, { buffer = win.buf })

  vim.keymap.set("n", "<Esc>", function()
    win:close()
  end, { buffer = win.buf })
end, { buffer = true, desc = "DAP: elegir DLL (flotante)" })
