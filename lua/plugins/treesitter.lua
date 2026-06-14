return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSUpdateSync" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "css",
                "html",
                "javascript",
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
