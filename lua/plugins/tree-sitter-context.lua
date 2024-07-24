return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local opts = {}
        require("treesitter-context").setup(opts)
    end,
}
