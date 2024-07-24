return {
    "brenoprata10/nvim-highlight-colors",
    config = function()
        local opts = {
            render = "virtual",
        }
        require("nvim-highlight-colors").setup(opts)
    end,
}
