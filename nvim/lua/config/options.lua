vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.cmd.colorscheme('catppuccin-mocha')

local opt = vim.opt
opt.termguicolors = true

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.autoindent = true

opt.scrolloff = 8
opt.number = true
opt.showmode = true
opt.showcmd = true
opt.visualbell = true

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.smartcase = true
opt.hlsearch = true
opt.cursorline = true    -- Enable highlighting of the current line
opt.ignorecase = true    -- Ignore case
opt.linebreak = true     -- Wrap lines at convenient points
opt.termguicolors = true -- True color support

opt.colorcolumn = "120"
opt.signcolumn = 'yes'
