return {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "stevearc/dressing.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    build = function()
        require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
        require("gitlab").setup()
        -- Assign keymaps and stuff
        vim.keymap.set(
            "n",
            "<leader>glc",
            require("gitlab").create_comment,
            { silent = true, desc = "Gitlab: MR: Create comment" }
        )
    end,
}
