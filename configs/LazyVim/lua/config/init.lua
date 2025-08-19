-- Carga todas las configuraciones de plugins que estén en conf-plugs
-- local plugins_confs = {
--     "autosessions",
--     -- agrega aquí más según vayas necesitando
-- }
--
-- for _, conf in ipairs(plugins_confs) do
--     local ok, err = pcall(require, "config.conf-plugs." .. conf)
--     if not ok then
--         vim.notify("Error loading config for " .. conf .. ": " .. err, vim.log.levels.ERROR)
--     end
-- end

-- También puedes cargar otros módulos generales aquí, si quieres
-- require("config.keymaps")
-- require("config.options")
-- require("config.autocmds")

local conf_dir = vim.fn.stdpath("config") .. "/lua/config/conf-plugs"
local handle = vim.loop.fs_scandir(conf_dir)

if handle then
  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end
    if type == "file" and name:sub(-4) == ".lua" then
      local module_name = "config.conf-plugs." .. name:sub(1, -5) -- quitar .lua
      local ok, err = pcall(require, module_name)
      if not ok then
        vim.notify("Error loading config for " .. module_name .. ": " .. err, vim.log.levels.ERROR)
      end
    end
  end
end
