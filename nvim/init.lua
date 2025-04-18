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
    ensure_installed = 'all',

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
---
-- LSP configuration
---

require('lspconfig').intelephense.setup({})
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                library = {
                    "${3rd}/love2d/library",
                },
            },
            diagnostics = {
                globals = {
                    'vim',
                },
            },
        },
    },
})
require('lspconfig').jsonls.setup({})
require('lspconfig').volar.setup({
    init_options = {
        vue = {
            hybridMode = false,
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                enumMemberValues = {
                    enabled = true,
                },
                functionLikeReturnTypes = {
                    enabled = true,
                },
                propertyDeclarationTypes = {
                    enabled = true,
                },
                parameterTypes = {
                    enabled = true,
                    suppressWhenArgumentMatchesName = true,
                },
                variableTypes = {
                    enabled = true,
                },
            },
        },
    },
})
require('lspconfig').ts_ls.setup({
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath 'data' ..
                '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { 'vue' },
            },
        },
    },
    settings = {
        typescript = {
            tsserver = {
                useSyntaxServer = false,
            },
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})
-- require('lspconfig').rust_analyzer.setup({})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup({
    ensure_installed = { "php-debug-adapter", "codelldb" }
})

local dap = require('dap')

dap.adapters.php = {
    type = 'executable',
    command = 'node',
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
            statusline = 100,
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

require("aerial").setup({
    on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})

require('gitsigns').setup {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    }
}
