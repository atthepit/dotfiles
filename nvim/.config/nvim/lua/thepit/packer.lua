-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder (files, lsp, etc)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'Mofiqul/dracula.nvim' -- The one and only theme

    use('nvim-treesitter/nvim-treesitter',{ run = ':TSUpdate' }) -- Highlight, edit, and navigate code
    use('theprimeagen/harpoon') -- Be able to swap between files fast
    use('mbbill/undotree') -- See a tree with all the changes made to a buffer
    use('tpope/vim-fugitive') -- See git status in nvim
    use 'lewis6991/gitsigns.nvim' -- See git changes on the open buffer
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

    use 'jose-elias-alvarez/null-ls.nvim' -- Allow non-lsp sources to hook into the LSP client

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
end)
