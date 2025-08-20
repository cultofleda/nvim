return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        explorer = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    layout = {
                        layout = {
                            position = "right",
                        },
                    },
                },
            },
        },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            "<leader><space>",
            function()
                Snacks.picker.files()
            end,
            "Find files",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            "[F]ind [b]uffers",
        },
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            "File [e]xplorer",
        },
        {
            "<leader>gw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "[G]rep [w]ord",
            mode = { "n", "x" },
        },
        {
            "<leader>gg",
            function()
                Snacks.picker.grep()
            end,
            desc = "[G]rep [g]lobal (in current directory)",
        },
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "[G]oto [d]efinition",
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command
                -- Create some toggle mappings
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
