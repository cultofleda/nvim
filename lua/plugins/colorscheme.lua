return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        lazy = false,
        -- config = function()
        --     vim.opt.background = "dark"
        --     vim.cmd.colorscheme("oxocarbon")
        -- end,
    },
    {
        "NTBBloodbath/doom-one.nvim",
        priority = 1000,
        lazy = false,
        setup = function()
            vim.g.doom_one_italic_comments = true
        end,
        -- config = function()
        --     vim.cmd.colorscheme("doom-one")
        -- end,
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = false,
        -- config = function()
        --     require("nightfox").setup({
        --         options = {
        --             styles = {
        --                 comments = "italic",
        --                 keywords = "bold",
        --                 types = "italic,bold",
        --             },
        --         },
        --     })
        --     vim.cmd.colorscheme("nightfox")
        -- end,
    },
    {
        "mellow-theme/mellow.nvim",
        prioritya = 1000,
        lazy = false,
        -- config = function()
        --     vim.cmd.colorscheme("mellow")
        -- end,
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nordic").load()
        end,
    },
}
