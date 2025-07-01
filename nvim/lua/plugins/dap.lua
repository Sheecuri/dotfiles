return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<F5>", function() require("dap").continue() end },
            { "<F7>", function() require("dap").step_into() end },
            { "<F8>", function() require("dap").step_over() end },
            { "<F12>", function() require("dap").step_out() end },
            { "<Leader>b", function() require("dap").toggle_breakpoint() end },
            { "<Leader>w", function() require("dap").toggle_watch() end },
            { "<Leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end },
            { "<Leader>dl", function() require("dap").run_last() end },
            { "<leader>du", function() require("dapui").toggle() end },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },
    {
        "theHamsta/nvim-dap-virtual-text"
    },
    {
        "nvim-telescope/telescope-dap.nvim"
    },
}
