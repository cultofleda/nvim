return {
    "stevearc/conform.nvim",
    opts = {
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
