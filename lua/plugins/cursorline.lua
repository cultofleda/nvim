return {
    "yamatsum/nvim-cursorline",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-cursorline").setup({})
    end,
}
