return {
    {
        "Vallen217/eidolon.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme eidolon-twilight")
        end,
    },
    {
        "olivercederborg/poimandres.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("poimandres").setup({})
        end,
        init = function()
            -- vim.cmd("colorscheme poimandres")
        end,
    },
}
