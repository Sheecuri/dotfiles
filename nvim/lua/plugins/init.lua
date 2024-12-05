return {
    { "catppuccin/nvim",               name = "catppuccin", priority = 1000 },
    -- 'morhetz/gruvbox',
    -- 'folke/tokyonight.nvim',
    'folke/which-key.nvim',
    'ncm2/ncm2',
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8',       dependencies = { 'nvim-lua/plenary.nvim' } },
    'nvim-treesitter/nvim-treesitter',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'tpope/vim-fugitive',
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui",             dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'ThePrimeagen/harpoon',

    -- LSP-ZERO
    "VonHeikemen/lsp-zero.nvim",
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    "jay-babu/mason-nvim-dap.nvim",

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    }
}
