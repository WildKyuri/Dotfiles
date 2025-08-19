-- lua/plugins/persistence.lua
return {
    { "mg979/vim-visual-multi" }, -- Multiline Editing
    { "rmagatti/auto-session" },
    { "lewis6991/gitsigns.nvim" },
    --            Markdown preview
    {
        -- Install markdown preview, use npx if available.
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function(plugin)
            if vim.fn.executable("npx") then
                vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
            else
                vim.cmd([[Lazy load markdown-preview.nvim]])
                vim.fn["mkdp#util#install"]()
            end
        end,
        init = function()
            if vim.fn.executable("npx") then
                vim.g.mkdp_filetypes = { "markdown" }
            end
        end,
    },
    --             BufferLine
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                mode = "tabs",
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
    --              Databases
    {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
        { -- optional saghen/blink.cmp completion source
            "saghen/blink.cmp",
            opts = {
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    per_filetype = {
                        sql = { "snippets", "dadbod", "buffer" },
                    },
                    -- add vim-dadbod-completion to your completion providers
                    providers = {
                        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                    },
                },
            },
        },
    },
    -- FiveServer
    {
        "Diogo-ss/five-server.nvim",
        cmd = { "FiveServer" },
        build = function()
            require("fs.utils.install")()
        end,
        opts = {
            notify = true,
            browser = "zen-browser",
        },
        config = function(_, opts)
            require("fs").setup(opts)
        end,
    },
}
