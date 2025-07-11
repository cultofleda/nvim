vim.lsp.enable({
    "vtsls",
    "lua_ls",
    "tailwindcss-language-server",
    "volar",
})

vim.diagnostic.config({
    float = {
        border = "rounded",
        source = true,
    },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
    underline = true,
    update_in_insert = false,
    virtual_lines = false,
    virtual_text = true,
})
