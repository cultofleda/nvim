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
        keys = {
            { "<leader>mi", "<CMD>MasonToolsInstall<CR>", desc = "[M]ason [i]nstall all" },
            { "<leader>mu", "<CMD>MasonToolsUpdate<CR>", desc = "[M]ason [u]pdate all" },
        },
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
            -- Only auto-install on machines you manage. On restricted machines
            -- (e.g. company laptop), leave NVIM_MANAGED unset and run
            -- :MasonToolsInstall (<leader>mi) manually when needed.
            run_on_start = vim.env.NVIM_MANAGED ~= nil,
        },
    },
}
