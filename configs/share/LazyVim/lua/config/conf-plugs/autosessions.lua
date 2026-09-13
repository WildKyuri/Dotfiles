require("auto-session").setup({
    auto_session_suppress_dirs = {
        "~/",
        "~/Projects",
        "~/Downloads",
        "/",
    },
    session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
        buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
    },
})
