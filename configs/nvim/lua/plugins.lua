--- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Common utilities
    use("nvim-lua/plenary.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    --Buffer Delete
    use ("famiu/bufdelete.nvim")

    -- ColorSchema
    use ({
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,  
        config = function()
            require("configs.sonokai")
        end
    })

    -- Dashboard
     use ({
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("configs.dashboard")
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    })

    -- Telescope
    use({
    	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Oil 
    use({
    "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons"},
        config = function()
            require("oil").setup({
                default_file_explorer = true,
            })
        end,
    })

    -- Neo tree
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    })

    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
	event = "BufEnter",
	config = function()
	    require("configs.lualine")
	end,
	requires = { "nvim-web-devicons" },
    })

    -- Show colors
    use({
    "norcalli/nvim-colorizer.lua",
        config = function()
	    require("colorizer").setup({ "*" })
        end,
    })

    -- Terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("configs.toggleterm")
        end,
    })

    -- Git
    use({
	"lewis6991/gitsigns.nvim",
	config = function()
	    require("configs.gitsigns")
	end,
    })

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() 
            vim.fn["mkdp#util#install"]() 
        end,
    })

    -- autopairs
    use({
        "windwp/nvim-autopairs",
	config = function()
	    require("configs.autopairs")
	end,
    })

    -- Aqui se pone feo porque son los lenguajes y auto comletados
    
    -- Treesitter 
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
	run = function()
	    require("configs.treesitter")
	end,
    })
    
    -- LSP DIAGNOSTIS
    use({
        "jose-elias-alvarez/null-ls.nvim",
	config = function()
	    require("configs.null-ls")
	end,
        requires = { "nvim-lua/plenary.nvim" },
    })
    
    -- Mason: Portable package manager
    use({
        "williamboman/mason.nvim", 
	config = function()
	    require("mason").setup()
	end,
	})
    use({
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
	config = function()
	    require("configs.mason-lsp")
	end,
	after = "mason.nvim",
    })
    
        -- REAL LSP
    use({
	"neovim/nvim-lspconfig",
        after = "mason-lspconfig.nvim",
	config = function()
            require("configs.lsp")
	end,
    })

    use("onsails/lspkind-nvim")
        
    -- cmp: Autocomplete
    use({
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
	    "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
	config = function()
	    require("configs.cmp")
	end,
    })
    use( 'saadparwaiz1/cmp_luasnip' )
    use( "hrsh7th/cmp-cmdline" )
    use( "hrsh7th/cmp-nvim-lsp" )
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

    -- LuaSnip
    use({
	"L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        tag = "v2.*",
        build = "make install_jsregexp",
        config = function()
            require("configs.luasnip")
        end,
    })
    use ( "rafamadriz/friendly-snippets" )

    --       Utilities
    
    -- Comment
    use({
        'numToStr/Comment.nvim',
        config = function()
            require("configs.comment")
        end
    })

    -- Ufo (code folding)
    use ({
        'kevinhwang91/nvim-ufo', 
        requires = {
            'kevinhwang91/promise-async'
        },
        config = function()
            require("configs.ufo")
        end,
    })
    use ( 'kevinhwang91/promise-async' )

    -- Wilder 
    use({
        'gelguy/wilder.nvim',
        config = function()
            require("configs.wilder")
        end,
    })

    -- Rainbow Delimiters
    use ({
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("configs.rainbow")
        end,
    })

    -- IndenBlankline
    use ({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("configs.indent-blankline")
        end, 
    })
end)

