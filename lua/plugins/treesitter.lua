return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSUpdateSync" },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "css",
                "html",
                "javascript",
                "lua",
                "python",
                "rust",
                "scss",
                "typescript",
                "vim",
                "vimdoc",
                "vue",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            modules = {},
            ignore_install = {},
        })
    end,
}
