local lazy = require("packagemanager/lazy")

return require("lazy").setup({
    lazy.eagerly({
        require("plugins/oil"),
        require("plugins/blink"),
        require("plugins/colorschema"),
        require("plugins/flash"),
        require("plugins/fugitive"),
        require("plugins/gitsigns"),
        require("plugins/harpoon"),
        require("plugins/lazydev"),
        require("plugins/markdown-renderer"),
        require("plugins/snacks"),
        require("plugins/snippets"),
        require("plugins/statusline"),
        require("plugins/todo-comments"),
        require("plugins/treesitter"),
        require("plugins/trouble"),
        require("plugins/which-key"),
    }),
    lazy.on_buf_read({
        require("lsp"),
    }),
    lazy.lazily({
        require("lsp.dap"),
        require("lsp.dap.js-dap"),
    }),
    -- lazy.on_insert_enter({}),
    -- lazy.on_idle({}),
})
