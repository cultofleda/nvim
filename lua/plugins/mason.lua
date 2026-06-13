return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = {
            { "<leader>m", "<CMD>Mason<CR>", desc = "[M]ason" },
        },
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                -- LSP servers
                "basedpyright",
                "css-lsp", -- vscode-css-language-server
                "lua-language-server",
                "some-sass-language-server",
                "typescript-language-server",
                "tailwindcss-language-server",
                -- Formatters
                "stylua",
                "black",
                "prettier",
                -- Linters
                "eslint_d",
            },
            auto_update = false,
            run_on_start = true,
        },
    },
}
