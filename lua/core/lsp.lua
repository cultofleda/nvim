local lsps = {
    "lua-language-server",
    -- perhaps it's important to configure vtsls before vue_ls, who knows
    "vtsls",
    "vue-language-server",
    "tailwindcss-language-server",
}

vim.lsp.enable(lsps)

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
    underline = false,
    update_in_insert = true,
    virtual_lines = false,
    virtual_text = true,
})
