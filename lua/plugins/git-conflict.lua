return {
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        config = true,
        init = function()
            require("git-conflict").setup({})

            vim.api.nvim_create_autocmd("User", {
                pattern = "GitConflictDetected",
                callback = function()
                    vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
                    vim.keymap.set("n", "cww", function()
                        engage.conflict_buster()
                        create_buffer_local_mappings()
                    end)
                end,
            })
        end,
    },
    {
        "sindrets/diffview.nvim",
        version = "*",
        config = function()
            require("diffview").setup({})
        end,
    },
}
