require('config.lazy')
require('config.keymaps')
require('config.options')
require('config.autocmds')

require("oil").setup({
    keymaps = {
        ["<C-p>"] = false
    }
})

require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}
require('telescope').setup({})
---
-- LSP configuration
---
vim.opt.signcolumn = 'yes'

local lspconfig = require('lspconfig')

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').intelephense.setup({})
-- require('lspconfig').phpactor.setup({
--     cmd = { "phpactor", "language-server" },
--     filetypes = { "php" },
--     root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
--     init_options = {
--         ["language_server_worse_reflection.inlay_hints.enable"] = true,
--         ["language_server_worse_reflection.inlay_hints.params"] = true,
--         ["language_server_worse_reflection.inlay_hints.types"] = true,
--         ["language_server_configuration.auto_config"] = false,
--         ["code_transform.import_globals"] = true,
--         ["language_server_php_cs_fixer.enabled"] = true,
--         ["language_server_php_cs_fixer.bin"] = "%project_root%/lumen/vendor/bin/php-cs-fixer",
--         ["language_server_php_cs_fixer.config"] = "%project_root%/lumen/.php-cs-fixer.php",
--         ["language_server_php_cs_fixer.env"] = {
--             ["XDEBUG_MODE"] = "off",
--             ["PHP_CS_FIXER_IGNORE_ENV"] = false,
--         },
--     },
-- })
require('lspconfig').lua_ls.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').ts_ls.setup({})

---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup({
    ensure_installed = { "php-debug-adapter" }
})

local dap = require('dap')
require('telescope').load_extension('dap')

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    -- change this to where you build vscode-php-debug
    args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },

}
dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9000,
        pathMappings = {
            ["/var/www"] = "${workspaceFolder}"
        }
    }
}

local dapui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dapui.setup()

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
        'fugitive',
        'oil',
        'mason',
        'nvim-dap-ui'
    }
}
