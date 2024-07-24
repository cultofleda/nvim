return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        local config = {
            animation = false,
            auto_hide = true,
        }
        require("barbar").setup(config)
        vim.keymap.set("n", "<S-l>", "<CMD>BufferNext<CR>", { silent = true })
        vim.keymap.set("n", "<S-h>", "<CMD>BufferPrevious<CR>", { silent = true })
        vim.keymap.set("n", "<C-p>", "<CMD>BufferPick<CR>", { silent = true })
        vim.keymap.set("n", "<leader>bd", "<CMD>BufferClose<CR>", { silent = true })
    end,
    version = "^1.0.0",
}
