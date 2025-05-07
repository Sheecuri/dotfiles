vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local undo_dir = vim.fn.stdpath('cache') .. "/undo/"
-- Creates the directory we are going to use for undo tracking
vim.fn.mkdir(undo_dir, 'p')
vim.opt.undofile = true

vim.cmd.colorscheme('catppuccin-mocha')
-- vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.clipboard:append('unnamedplus')

vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.scrolloff = 12
vim.opt.number = true
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.visualbell = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.cursorline = true    -- Enable highlighting of the current line
vim.opt.ignorecase = true    -- Ignore case
vim.opt.linebreak = true     -- Wrap lines at convenient points
vim.opt.termguicolors = true -- True color support
vim.opt.colorcolumn = "200"
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.jumpoptions = "stack,view"
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.splitbelow = true
