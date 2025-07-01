return {
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

    -- root_dir = function(filename, bufnr)
    --     -- Custom root directory detection
    --     -- This helps eslint-lsp find the nearest config from the current file
    --     return lspconfig.util.root_pattern(
    --         "eslint.config.js",
    --         "eslint.config.mjs",
    --         ".eslintrc.js",
    --         ".eslintrc.cjs",
    --         ".eslintrc.json",
    --         ".eslintrc.yaml",
    --         ".eslintrc.yml",
    --         ".eslintrc"
    --     )(filename, bufnr)
    -- end,
}
