local filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "html" }

return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = filetypes,

    root_markers = {
        "package.json",
        "tailwind.config.cjs",
        "tailwind.config.js",
        "tailwind.config.mjs",
        "tailwind.config.ts",
    },

    capabilities = require("blink.cmp").get_lsp_capabilities(),

    settings = {
        tailwindCSS = {
            classFunctions = { "cva", "cx" },
        },
    },
}
