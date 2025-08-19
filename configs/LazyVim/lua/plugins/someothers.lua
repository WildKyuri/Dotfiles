return {
    -- Surfing code
    {
        "stevearc/aerial.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Incremental rename
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        keys = {
            {
                "<leader>rn",
                function()
                    return ":IncRename " .. vim.fn.expand("<cword>")
                end,
                desc = "Incremental rename",
                mode = "n",
                noremap = true,
                expr = true,
            },
        },
        config = true,
    },

    -- Refactoring tool
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>r",
                function()
                    require("refactoring").select_refactor({
                        show_success_message = true,
                    })
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
            },
        },
        opts = {},
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        pattern = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "KyuriNotes",
                    path = "/mnt/d/OBSIDIAN/",
                },
            },
            disable_frontmatter = true,
            disable_autocommands = true, -- Desactiva los autocomandos por defecto
            notes_subdir = "03 limbo",
            templates = {
                subdir = "99 Meta/Templates",
            },
        },
    },
}
