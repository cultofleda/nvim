return {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialNext", "AerialPrev" },
    keys = {
        { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "[A]erial toggle" },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
    },
}
