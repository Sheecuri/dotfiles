return {
    "stevearc/oil.nvim",
    ---@module "oil"
    ---@type oil.SetupOpts
    opts = {},
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" },     -- use if prefer nvim-web-devicons
    keys = {
        { "<C-e>", "<cmd>Oil<CR>" },
    },
}
