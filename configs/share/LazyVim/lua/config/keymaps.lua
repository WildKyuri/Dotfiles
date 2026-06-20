local keymap_files = {
  "keys-general",
  "keys-snacks",
  "keys-plugins",
  "keys-toggleterm",
}

for _, file in ipairs(keymap_files) do
  local ok, err = pcall(require, "config.keymaps." .. file)
  if not ok then
    vim.notify("Error loading keymaps: " .. file .. "\n" .. err, vim.log.levels.ERROR)
  end
end
