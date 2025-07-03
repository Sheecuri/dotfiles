return {
    -- build debugger from source
    "microsoft/vscode-js-debug",
    version = "1.x",
    build = "npm i && npm run compile vsDebugServerBundle && rm -rf out && mv dist out",

    ft = { "svelte", "typescript", "javascript", "vue" },
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function()
        local path = vim.fn.expand("%")
        local test_type
        if path:find("/integration/") then
            test_type = "integration"
        elseif path:find("/unit/") then
            test_type = "unit"
        else
            test_type = "undefined"
        end

        for _, language in ipairs({ "typescript", "javascript", "vue", "svelte" }) do
            require("dap").adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = { "/home/patrick/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
                }
            }
            require("dap").configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Debug Jest",
                    -- trace = true, -- include debugger info
                    runtimeExecutable = "node",
                    runtimeArgs = {
                        "./node_modules/jest/bin/jest.js",
                        "--runInBand",
                        "--config=apps/server/test/" .. test_type .. "/jest.config.ts",
                        "${file}"
                    },
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    internalConsoleOptions = "neverOpen",
                },
                -- attach to a node process that has been started with
                -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
                -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
                {
                    type = "pwa-node",
                    -- attach to an already running node process with --inspect flag
                    port = 9229,
                    request = "attach",
                    -- allows us to pick the process using a picker
                    processId = require 'dap.utils'.pick_process,
                    -- name of the debug action you have to select for this config
                    name = "Attach debugger to existing `node --inspect` process",
                    -- for compiled languages like TypeScript or Svelte.js
                    sourceMaps = true,
                    -- resolve source maps in nested locations while ignoring node_modules
                    resolveSourceMapLocations = {
                        "${workspaceFolder}/**",
                        "!**/node_modules/**" },
                    -- path to src in vite based projects (and most other projects as well)
                    cwd = "${workspaceFolder}/src",
                    -- we don't want to debug code inside node_modules, so skip it!
                    skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
                },
                {
                    type = "pwa-chrome",
                    name = "Launch Chrome to debug client",
                    request = "launch",
                    url = "http://localhost:5173",
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222,
                    webRoot = "${workspaceFolder}/src",
                    -- skip files from vite's hmr
                    skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
                },
                -- only if language is javascript, offer this debug action
                language == "javascript" and {
                    -- use nvim-dap-vscode-js's pwa-node debug adapter
                    type = "pwa-node",
                    -- launch a new process to attach the debugger to
                    request = "launch",
                    -- name of the debug action you have to select for this config
                    name = "Launch file in new node process",
                    -- launch current file
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                } or nil, }
        end
    end
}
