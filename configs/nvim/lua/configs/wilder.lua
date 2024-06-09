local status, wd = pcall(require, "wilder")

if not status then
    return
end

wd.setup({
    modes = {':', '/', '?'},
    enable_cmdline_enter = 0,
})
