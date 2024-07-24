return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        local opts = {
            formatters_by_ft = {
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                lua = { "stylua" },
                python = { "black" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                vue = { "prettier" },
            },
        }
        local conform = require("conform")
        conform.setup(opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                conform.format({ bufnr = args.buf })
            end,
        })
    end,
}
