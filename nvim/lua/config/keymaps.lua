local map = vim.keymap.set

map("n", "<leader>l", vim.cmd.Lazy)
map("n", "<C-e>", vim.cmd.Oil)
map("n", "<leader>bn", vim.cmd.bnext)
map("n", "<leader>bp", vim.cmd.bprev)

--TODO: Move to /after
map('n', '<leader>cb', '<cmd>!cargo build<cr>')
map('n', '<leader>cr', '<cmd>!cargo run<cr>')
map("n", "<leader>cn", function()
    return ":!cargo new "
end, { expr = true })

map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- Debug Adapter
map('n', '<F5>', function() require('dap').continue() end)
map('n', '<F7>', function() require('dap').step_into() end)
map('n', '<F8>', function() require('dap').step_over() end)
map('n', '<F12>', function() require('dap').step_out() end)
map('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
map('n', '<Leader>w', function() require('dap').toggle_watch() end)
map('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
map('n', '<Leader>dl', function() require('dap').run_last() end)
map("n", "<leader>du", ":lua require'dapui'.toggle()<cr>", {})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file)
map("n", "<leader>h", ui.toggle_quick_menu)

map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-j>", function() ui.nav_file(2) end)
map("n", "<C-k>", function() ui.nav_file(3) end)
map("n", "<C-l>", function() ui.nav_file(4) end)

-- Todo Comments
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("n", "<leader>fn", "<cmd>AerialToggle!<CR>")
