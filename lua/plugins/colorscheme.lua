return {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    priority = 1000,
    lazy = false,
    config = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("oxocarbon")
    end,
}
