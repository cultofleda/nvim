return {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme("tokyonight-night")
    end,
}
