local lazy = require("packagemanager/lazy")

return require("lazy").setup({
    lazy.eagerly({
        require("plugins/oil"),
        require("plugins/colorschema"),
        require("plugins/harpoon"),
        require("plugins/lazydev"),
        require("plugins/snacks"),
    }),
    lazy.on_buf_read({
        require("lsp"),
        require("plugins/treesitter"),
        require("plugins/todo-comments"),
        require("plugins/gitsigns"),
        require("plugins/statusline"),
        require("plugins/markdown-renderer"),
        require("plugins/fugitive"),
        require("plugins/conform"),
    }),
    lazy.lazily({
        require("lsp.debugger"),
        require("lsp.debugger.js-dap"),
        require("plugins/trouble"),
    }),
    lazy.on_insert_enter({
        require("plugins/blink"),
        require("plugins/snippets"),
        require("plugins/which-key"),
        require("plugins/flash"),
    }),
    -- lazy.on_idle({}),
})
