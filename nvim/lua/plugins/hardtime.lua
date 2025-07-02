return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
        disabled_keys = {
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
        },
        restricted_keys = {
            ["<Up>"] = { "n", "x" },
            ["<Down>"] = { "n", "x" },
            ["<Left>"] = { "n", "x" },
            ["<Right>"] = { "n", "x" },
            ["w"] = { "n", "x" },
            ["b"] = { "n", "x" },
            ["e"] = { "n", "x" },
            ["ge"] = { "n", "x" },
        }
    }
}
