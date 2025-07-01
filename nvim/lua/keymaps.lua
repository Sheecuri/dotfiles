-- delete highlights on escape
vim.keymap.set("n", "<ESC>", ":noh<CR>", { silent = true })

-- Don't save deletion to register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Don't save change to register
vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]])

-- Toggle inlay hints
vim.keymap.set('n', '<leader>ih', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })
