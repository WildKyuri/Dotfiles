-- Cargar configuración general
require("config.conf-plugs.dap.dap_setup")

-- Cargar configuraciones por lenguaje
local langs = {
  "csharp",
  "python",
}

for _, lang in ipairs(langs) do
  local ok, _ = pcall(require, "config.conf-plugs.dap." .. lang)
  if not ok then
    vim.notify("No DAP config for " .. lang, vim.log.levels.DEBUG)
  end
end
