-- Remove keybindings from space
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- set leader to space key
vim.g.mapleader = " "


-- save undo history to stay persistent after closing neovim
local undo_dir = vim.fn.stdpath("cache") .. "/undo/"
vim.fn.mkdir(undo_dir, "p")
vim.opt.undofile = true

-- vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Enable 24-bit RGB color support
vim.opt.termguicolors = true

-- Replace tabs with spaces
vim.opt.expandtab = true

-- Set tab size
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- vim.opt.tabstop = 4 -- Might not be needed due to the above settings

-- vim.opt.autoindent = true -- true should be default according to docs

-- Alays keep n lines above or below the cursor when scrolling
vim.opt.scrolloff = 12

-- show line number
vim.opt.number = true

-- Show which mode we are in, we don"t want this as we get this information from the status line
vim.opt.showmode = false

-- Show the current command on the bottom right
vim.opt.showcmd = true

-- Ignore case for pattern searching
vim.opt.ignorecase = true
-- Override ignorecase if pattern contains an uppercase letter
vim.opt.smartcase = true

-- Highlight the current line
vim.opt.cursorline = true

-- Wrap lines at convenient points
vim.opt.linebreak = true

-- Show a column on the left of the line numbers reserved for signs.
-- We always want to show the column so the editor width stays consistent
vim.opt.signcolumn = "yes"

-- Show what is affectend by a command in a new temporary window
vim.opt.inccommand = "split"

-- Show what the pattern matches while still typing it
vim.opt.incsearch = true

-- Preserve the jump list
-- TODO check how the options behave
vim.opt.jumpoptions = "stack,view"

-- TODO check how the options behave
-- vim.opt.splitkeep = "screen"

-- Create a new vertical split to the right of the current window
vim.opt.splitright = true

-- Create a new horizontal split below the current window
vim.opt.splitbelow = true

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Disable swapfiles and instead trigger autoread every time a buffer is entered/ focused
vim.opt.swapfile = false
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = { "*.*" },
	callback = function()
		vim.cmd([[checktime]])
	end,
})

-- Show a column to visualize where the line length limit is
-- TODO: can this be done project specific?
vim.opt.colorcolumn = "200"
