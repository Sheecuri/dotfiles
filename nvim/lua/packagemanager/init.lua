local lazy = require("packagemanager/lazy")

return require("lazy").setup({
    lazy.eagerly({
        require("plugins/blink"),
        require("plugins/colorschema"),
        require("plugins/dap"),
        require("plugins/flash"),
        require("plugins/fugitive"),
        require("plugins/gitsigns"),
        require("plugins/harpoon"),
        require("plugins/lazydev"),
        require("plugins/lsp"),
        require("plugins/markdown-renderer"),
        require("plugins/oil"),
        require("plugins/snacks"),
        require("plugins/snippets"),
        require("plugins/statusline"),
        require("plugins/todo-comments"),
        require("plugins/treesitter"),
        require("plugins/trouble"),
        require("plugins/which-key"),
    }),
    -- lazy.on_insert_enter({}),
    -- lazy.lazily({}),
    -- lazy.on_buf_read({}),
    -- lazy.on_idle({}),
})
