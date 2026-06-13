return {
    "aznhe21/actions-preview.nvim",
    config = function()
        require("actions-preview").setup({
            backend = { "snacks" },
        })
    end,
}
