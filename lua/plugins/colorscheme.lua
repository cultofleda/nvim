return {
    "ramojus/mellifluous.nvim",
    name = "mellifluous",
    priority = 1000,
    lazy = false,
    config = function()
        require("mellifluous").setup({
            mellifluous = {
                neutral = true,
            },
        })
        vim.cmd.colorscheme("mellifluous")
    end,
}
