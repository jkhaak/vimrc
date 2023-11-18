local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    'folke/tokyonight.nvim',

    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },

    'nvim-treesitter/playground',
    'nvim-lua/plenary.nvim',
    'theprimeagen/harpoon',
    'theprimeagen/refactoring.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'nvim-treesitter/nvim-treesitter-context',

    { 'williamboman/mason.nvim',          lazy = false,   config = true },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    'folke/zen-mode.nvim',
    'github/copilot.vim',
    'eandrju/cellular-automaton.nvim',
    'laytan/cloak.nvim',

    'terrortylor/nvim-comment',

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    { 'windwp/nvim-autopairs',    event = "InsertEnter" },

    'RRethy/vim-illuminate',

    'simrat39/rust-tools.nvim',
    { 'folke/todo-comments.nvim', opts = {},            dependencies = { 'nvim-lua/plenary.nvim' } },

    "tpope/vim-repeat",
    'ggandor/lightspeed.nvim',

    {
        'saecki/crates.nvim',
        tag = 'v0.4.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
    }

})
