return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })

        require("conform").formatters_by_ft.lua = {
            "stylua",
        }
        require("conform").formatters_by_ft.rust = {
            "rustfmt",
        }
        for _, language in ipairs({ "typescript", "javascript", "vue", "svelte" }) do
            require("conform").formatters_by_ft[language] = {
                "eslint_d",
                "eslint",
                "prettierd",
                "prettier",
                stop_after_first = true
            }
        end

        vim.api.nvim_create_autocmd("BufReadPost", {
            callback = function(args)
                vim.keymap.set({ 'n', 'x' }, "<F3>", function() require("conform").format({ bufnr = args.buf }) end)
            end
        })
    end
}
