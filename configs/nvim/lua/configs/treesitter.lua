local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

ts.setup({
    highlight = {
        enable = true,
	    additional_vim_regex_highlighting = false,
        },
        context_commentstring = {
	    enable = true,
	    enable_autocmd = false,
	},
	ensure_installed = {
	    "markdown",
	    "tsx",
	    "typescript",
	    "javascript",
	    "toml",
	    "c_sharp",
	    "json",
	    "yaml",
	    "rust",
	    "css",
	    "html",
	    "lua",
	},
        rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            --disable = { 'jsx', 'cpp' }, 
            -- Which query to use for finding delimiters
            query = 'rainbow-delimiters',
            -- Highlight the entire buffer all at once
            strategy = require('rainbow-delimiters').strategy.global, 
        },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
