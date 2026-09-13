return {
    {
        "stevearc/oil.nvim",
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            view_options = {
                show_hidden = true, -- Mostrar archivos ocultos
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        opts = {
            ensure_installed = {
                "toml",
                "yaml",
                "rust",
                "regex",
                "lua",
                "bash",
                "markdown",
                "tsx",
                "typescript",
                "javascript",
                "json",
                "css",
                "python",
                "query",
                "html",
                "c_sharp",
                "c",
                "cpp",
                "python",
            },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        },
    },
}
