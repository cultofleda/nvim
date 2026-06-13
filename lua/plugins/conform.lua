return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            lua = { "stylua" },
            python = { "black" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
        },
    },
}
