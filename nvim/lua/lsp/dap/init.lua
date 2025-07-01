return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
        },
        keys = {
            { "<F5>",       function() require("dap").continue() end },
            { "<F7>",       function() require("dap").step_into() end },
            { "<F8>",       function() require("dap").step_over() end },
            { "<F12>",      function() require("dap").step_out() end },
            { "<Leader>b",  function() require("dap").toggle_breakpoint() end },
            { "<Leader>w",  function() require("dap").toggle_watch() end },
            { "<Leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end },
            { "<Leader>dl", function() require("dap").run_last() end },
            { "<leader>du", function() require("dapui").toggle() end },
        },
        config = function()
            require("dapui").setup()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({ reset = true })
            end
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close
        end
    },
}
