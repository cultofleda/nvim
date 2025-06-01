return {
    "aznhe21/actions-preview.nvim",
    opts = {},
    setup = function()
        require("actions-preview").setup({
            backend = { "telescope" },
        })
    end,
}
