return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
        keys = {
            { "<leader>cm", "<CMD>Mason<CR>", desc = "Open mason" },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = { "lua_ls" },
            ensure_installed = {
                "lua_ls",
                "vtsls",
                "vue_ls",
            },
        },
        dependencies = {},
    },
}
