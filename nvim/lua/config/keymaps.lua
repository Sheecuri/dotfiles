local map = vim.keymap.set

map("n", "<leader>l", vim.cmd.Lazy)
map("n", "<leader>pv", vim.cmd.Oil)
map("n", "<leader>bn", vim.cmd.bnext)
map("n", "<leader>bp", vim.cmd.bprev)

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>vh', builtin.help_tags, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>gs', builtin.git_status, {})
map('n', '<leader>gc', builtin.git_commits, {})
map('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

map('n', '<leader>cb', '<cmd>!cargo build<cr>')
map('n', '<leader>cr', '<cmd>!cargo run<cr>')
map("n", "<leader>cn", function()
    return ":!cargo new "
end, { expr = true })

--
-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

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

map("n", "<C-j>", function() ui.nav_file(1) end)
map("n", "<C-k>", function() ui.nav_file(2) end)
map("n", "<C-l>", function() ui.nav_file(3) end)
