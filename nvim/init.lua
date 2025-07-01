require("core")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

require("oil").setup({
    keymaps = {
        ["<C-p>"] = false
    }
})

require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
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

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({})
lspconfig.intelephense.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                library = {
                    "${3rd}/love2d/library",
                },
            },
            diagnostics = {
                globals = {
                    "vim",
                },
            },
        },
    },
})
lspconfig.jsonls.setup({})
lspconfig.volar.setup({
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
lspconfig.ts_ls.setup({
    on_attach = function(client)
        -- Disable tsserver formatting in favor of eslint
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath "data" ..
                "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
            },
        },
    },
    settings = {
        typescript = {
            tsserver = {
                useSyntaxServer = false,
            },
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        }
    },
})

lspconfig.eslint.setup {
    -- Enable ESLint to run in all JavaScript/TypeScript files
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },

    -- Configure ESLint to find the nearest config file
    settings = {
        packageManager = "yarn", 
        experimental = {
            useFlatConfig = true, -- Enable for eslint.config.js/mjs format
        },
        -- Set to look for both regular .eslintrc.* and eslint.config.js/mjs files
        workingDirectories = { mode = "auto" },

        -- This is important for monorepos - it determines how ESLint finds configs
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine"
            },
            showDocumentation = {
                enable = true
            },
        },

        -- Additional options to help find the right config
        validate = "on",
        rulesCustomizations = {},
        run = "onType",
        problems = {
            shortenToSingleLine = false
        },
        nodePath = "",
    },

    on_attach = function(client, bufnr)
        -- You can keep the existing formatting capability
        -- Or override it if you"re also using tsserver

        -- Optional: Create a command to manually run ESLint fix
        vim.api.nvim_buf_create_user_command(bufnr, "EslintFix", function()
            vim.cmd("EslintFixAll")
        end, { desc = "Fix all eslint errors" })
    end,

    root_dir = function(filename, bufnr)
        -- Custom root directory detection
        -- This helps eslint-lsp find the nearest config from the current file
        return lspconfig.util.root_pattern(
            "eslint.config.js",
            "eslint.config.mjs",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.json",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc"
        )(filename, bufnr)
    end,
}

-- lspconfig.eslint.setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup({
    ensure_installed = { "php-debug-adapter", "codelldb" }
})

local dap = require("dap")

dap.adapters.php = {
    type = "executable",
    command = "node",
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

local dapui = require("dapui")

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

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
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
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
        "fugitive",
        "oil",
        "mason",
        "nvim-dap-ui"
    }
}

require("gitsigns").setup {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    }
}
